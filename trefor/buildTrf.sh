#!/bin/bash
#   Script for building Trefor
# This shell uses parts of fancyo script written by Wayne Pollock, Tampa FL 1996

# Define a shell function called Pause
#Pause()
#{
#    echo
#    echo -n Hit Enter to continue....
#    read
#}

Pause()
{
    key=""
    echo -n Hit any key to continue....
    stty -icanon
    key=`dd count=1 2>/dev/null`
    stty icanon
}

echo This script builds trefor in local dir.  
echo If it is successful move trf etc. to /usr/local/bin
Pause
 #SYSTYPE="pgf"
 #SYSTYPE="MPA_f95i"
 #SYSTYPE="ifort"
  SYSTYPE="gfortran"
 # SYSTYPE="cygwin_ifort"
 # SYSTYPE="cygwin_f90"   
 # SYSTYPE="MPA_f95n"
 echo SYSTYPE ${SYSTYPE}
 export SYSTYPE=${SYSTYPE}

 case "${SYSTYPE}" in
      'ifort')
            FC=ifort
               ;;
      'gfortran')
            FC=gfortran
               ;;
      'MPA_f95i')
            FC=f95i
               ;;
      'MPA_f95n')
            FC=f95n
               ;;
      'pgf')
            FC=pgf95
               ;;
      'cygwin_ifort')
            FC=ifl
               ;;
      'cygwin_f90')
            FC=f90
               ;;
 esac
  
 echo Fortran Compiler version: 
 $FC -v
 rc=$?
if [ $rc != 0 ] ; then
   echo Fortran Compiler $FC not found! 
   echo I exit now due to this error...
   exit 1
else
   echo Fortran Compiler $FC
#   exit 0    
fi

# ----------------------------------  Start of preparations
 HOMETrefor=`pwd`
 echo '******'
 echo current directory is:
 echo $HOMETrefor
 echo '******'
 export HOMETrefor=$HOMETrefor
if [ ! -e $HOMETrefor/bin  ]; then
   mkdir $HOMETrefor/bin
   echo directory $HOMETrefor/bin created
fi  



# Compile the "trf" command
Pause				# invoke the function Pause.
echo trf command and trefor preprocessor are needed. 
echo If they are not found  in /usr/local/bin they will be built in $HOMETrefor/bin/trf
echo For future work save trf and trefor in your PATH, and $HOMETrefor/trefor/.trfrc in your $HOME
if [ ! -e $HOMETrefor/bin/trf ]; then
  if [ ! -e /usr/local/bin/trf ]; then
   cd $HOMETrefor/ctrf2005
   pwd
   make conf
   make all
   make all95
   mv trf trefor trefor95 $HOMETrefor/bin
   make clean
   echo '******'
   echo "trf (Trefor preprocessor) created"
   echo '******'
  else
     echo trf found in /usr/local/bin
  fi
fi
# add $HOMETrefor/bin/ to PATH
 export PATH=$HOMETrefor/bin:"$PATH"

echo Now copy
echo  cp ctrf2005/.trfrc ~/
echo  sudo cp ctrf2005/trefor.xml /usr/share/kde4/apps/katepart/syntax/trefor.xml
echo  in modern KDE:
echo  sudo cp ctrf2005/trefor.xml  ~/.local/share/katepart5/syntax
echo and move:
echo  sudo mv bin/trf bin/trefor bin/trefor95 /usr/local/bin/
echo and you are done 
