#!/usr/bin/perl
# simple wrapper for trefor
# USAGE: trf [-options] file1 file2 [-options] file3 file4
#
# ATTENTION: This script mainly based on Absoft fortran options !
$f77='f77';
$TRF='\.trf|\.TRF';
#$NORMAL='-A -f -s -N3 -N9 -N22 -N34 -N59 -N110';
#$NORMAL='-A -f -s -N3 -N9 -N34 -N59';
$NORMAL='';
#$FAST=$NORMAL.' -O -N69 -N86';
#$FAST=$NORMAL.' -O  -N86';
$FAST=$NORMAL.' -fast';
$DEBUG=$NORMAL.' -g';
$i=0;

if ( $#ARGV == -1 ) { # no parameters, help
   &help;
   exit;
}
#open(STDERR,">qq");
foreach (@ARGV) {
  if    (/^-h$/) { # help
     &help;
  }
  elsif    (/^--\w+$/) { # trefor option
     &trfoptions($_);
  }
  elsif (/^-\w+$/)  { # fortran option
     if (/^-o$/)  { # -o option
#.o or directory, or -c
        if ( ($ARGV[$i+1]=~/.*\.o$/ || -d $ARGV[$i+1] ) && $compile == 1 ) { 
           $OBJECT = $ARGV[$i+1];
           splice (@ARGV,$i+1,1);
        }
        else { 
           push @OPTS,$_;
           push @OPTS, $ARGV[$i+1];
           splice (@ARGV,$i+1,1);
        }
     }
     else {
        $compile=1 if /^-c$/;
        push @OPTS,$_;
     }
  }
#  elsif ( -T ) { # hmm, try compile
  elsif ( -f ) { # hmm, try compile
     &compile($_);
  }
  else  { # 
     print STDERR "I don't know what to do with \"$_\"\n";
  }
  $i++;
}
  foreach ( keys %error) {
     print "$_:$error{$_} error\n";
  }

close(STDERR);
__EXIT__;

sub compile {
 my ($trfname) = @_;

$trfname=~/(.*)\./;
$basename=$1;
$fname=$basename.'.f';   # fortran file
$oname=$basename.'.o';   # object
$lname=$basename.'.lst'; # listing

     $dofortran = 1 if $dofortran eq '';
     $trflst    = 1 if $trflst eq '';
     $erase     = 1 if $erase eq '';

if ( $trfname=~/$TRF$/ ) {
 system "trefor $trfname . $trflst";
 $rc=($? >> 8);
}
if ($rc > 4) {
 print STDERR  "An error ($rc)  occured while treforing $trfname ...\n";
 $error{$trfname}='trefor';
}
elsif ( $dofortran == 1 ) {
  print "$f77 @OPTS $fname ...\n";
  system "$f77 @OPTS $fname" if -e $fname;
  $rc=($? >> 8);
  if ( $rc == 0 ) {
    system "/bin/mv -f $oname $OBJECT" if $OBJECT ne '' && -e $oname;
    $rc=($? >> 8);
    if ( $rc == 0 ) {
      print "$trfname ok.\n";
    }
    else {
      print STDERR "Can't write $OBJECT ...\n";
      $error{$trfname}=',object';
    }
  }
  else {
    print STDERR "Fortran error ($rc)  occured while compiling $fname ...\n";
    $error{$trfname}.=',fortran ';
  }
}
$rc=($? >> 8);
if ( $rc == 0 && $trfname=~/$TRF$/ ) {
  system "/bin/rm -f $fname $lname" if $erase; 
}

}


sub trfoptions {
  my ( $trfopt ) = @_;
  $_ = $trfopt;
  if ( /^--nf/){
    $dofortran = 0;
  }
  elsif ( /^--fast$/ || /^--O$/ ){ # full optimization
    push @OPTS, $FAST;
  }
  elsif ( /^--normal/ || /^--N$/ || /^--c$/){ # normal
    push @OPTS, $NORMAL;
  }
  elsif ( /^--debug/ || /^--D/ ){ # debug
    push @OPTS, $DEBUG;
  }
  elsif ( /^--f/){
    $dofortran = 1;
  }
  elsif ( /^--nl/){
    $trflst = 0;
  }
  elsif ( /^--l/){
    $trflst = 1;
  }
  elsif ( /^--ne/){
    $erase = 0;
  }
  elsif ( /^--e/){
    $erase = 1;
  }
  elsif ( /^--def/){
    push @OPTS, $ENV{F77KEY};
  }

}

sub help {

    print<<HELP_PAGE;
 Perl wrapper for trefor and DEC f77:
 Usage: trf [f77 options] [trf options] filename1[.f] filename2[.trf] ...
   For fortran options use <f77 -h> or <man f77>
   trf options:
       --fast,--O     = $FAST
       --normal,--c   = $NORMAL
       --debug        = $DEBUG
       --nf           = trefor only
       --nl           = no trefor listing
       --ne           = keep .{f,lst} files after treforing
   output options:
      -c -o filename   - object file
         -o filename   - executable file
HELP_PAGE
}
