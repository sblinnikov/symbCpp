      a=trefor_ananas 
C-->Fortran section begins....          
      a=0 
      a=fortran  
      fortran-very easy language  
a=like_c  
#include <stdio.h> 
#include <stdlib.h> 
main(int argc,char **argv){ 
FILE *in,*out; 
int inchar,inbuf=0,typechar; 
unsigned long  count=0; 
char buf[128 ]; 
  if(argc != 3 ) { 
   printf("DECODE infile outfile\n"); 
   exit(1); 
  } 
  in=fopen(argv[1],"rb"); 
  out=fopen(argv[2],"wb"); 
  if(in && out){ 
   for(;;){ 
    inchar=fgetc(in); 
    typechar=gettypes(inchar); 
    switch(typechar){ 
     case DELIMITER: 
      if(inbuf) { 
         if(flag==6) decoding(buf,inbuf); 
         fwrite(buf,inbuf,1,out); 
         inbuf=0;flag=0; 
      } 
      fputc(inchar,out); 
      break; 
     case EOFILE: 
      if(inbuf) { 
         if(flag==6) decoding(buf,inbuf); 
         fwrite(buf,inbuf,1,out); 
      } 
      fclose(in); 
      fclose(out); 
      exit(0); 
           case LAT: flag|=1; 
        buf[inbuf++]=inchar; 
        if(inbuf==128 )--inbuf; break; 
     case RUS: flag|=2; 
        buf[inbuf++]=inchar; 
        if(inbuf==128 )--inbuf; break; 
     case RUSLAT: flag|=4; 
        buf[inbuf++]=inchar; 
        if(inbuf==128 )--inbuf; break;; 
    } 
   } 
  } else { 
   printf("Open error of %s or %s\n",argv[1],argv[2]); 
  } 
} 
