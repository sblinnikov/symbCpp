/******************************************************************
 (C) Popolitov Vladlen, 10 Apr 1996 . This code has been written
 
******************************************************************/ 



#include <time.h>

#ifdef NAME_

#define etime etime_
#define dtime dtime_
#define secnds secnds_
#define ibcdate ibcdate_
#define itime itime_
#define loctime loctime_
#else
#ifdef _NAME

#define etime _etime
#define dtime _dtime
#define secnds _secnds
#define ibcdate _ibcdate
#define itime _itime
#define loctime _loctime

#endif
#endif

static time_t  iLastTime=0,iStartTime=0;

int loctime=1; 

float dtime(float aTime[2]){
 time_t iNewTime;
 time(&iNewTime);
 if(!iStartTime)
  iStartTime=iNewTime;
 aTime[1]=aTime[0]=iNewTime-iLastTime;
 iLastTime=iNewTime;
 return aTime[1]+aTime[0];
}

/*

float etime(float aTime[2]){
 time_t iNewTime;
 time(&iNewTime);
 if(!iStartTime)
  iStartTime=iNewTime;
 aTime[1]=0.0;
 aTime[0]=iNewTime-iStartTime;
 return aTime[0];
}

*/

/*
   From elgin@claudia.spectral.com (Jim Elgin)
*/

/*  supply "etime" fortran routine

 NAME
      etime - return elapsed execution time

 SYNOPSIS
      REAL function etime (tarray)
      REAL tarray(2)

 DESCRIPTION
      This routine returns elapsed runtime in seconds for the calling
      process.

      The argument array returns user time in the first element and system
      time in the second element.  The function value is the sum of user and
      system time.

      The resolution of all timing is 1/CLK_TCK seconds, where CLK_TCK is
      processor dependent.
*/
/*
float etime_(tarray)
float *tarray;
{
#include <unistd.h> 
#include <time.h>
struct tms buf;
float t1, t2, den, tot;

times(&buf);
t1 = buf.tms_utime;
t2 = buf.tms_stime;
den = sysconf(_SC_CLK_TCK);
*tarray = t1/den;
*(tarray+1) = t2/den;
tot = *tarray + *(tarray+1);
return tot;
}
*/

float secnds(float *t0){
time_t iCurrent;
struct tm *stime;
 time(&iCurrent);
 if(!iStartTime)
  iStartTime=iCurrent;
 if(loctime)
  stime=localtime(&iCurrent);
 else 
  stime=gmtime(&iCurrent);  
 return ((float)((stime->tm_hour*24+stime->tm_min)*60+stime->tm_sec)-*t0);
}


void ibcdate(int *Month,int *Day,int *Year){
time_t iCurrent;
struct tm *stime;
 time(&iCurrent);
 if(!iStartTime)
  iStartTime=iCurrent;
 if(loctime)
  stime=localtime(&iCurrent);
 else 
  stime=gmtime(&iCurrent);  
 *Month=stime->tm_mon;
 *Day=stime->tm_mday;
 *Year=stime->tm_year;
}

void itime(int aTime[3]){
time_t iCurrent;
struct tm *stime;
 time(&iCurrent);
 if(!iStartTime)
  iStartTime=iCurrent;
 if(loctime)
  stime=localtime(&iCurrent);
 else 
  stime=gmtime(&iCurrent);  
 aTime[0]=stime->tm_hour;
 aTime[1]=stime->tm_min;
 aTime[2]=stime->tm_sec;
 return ;
}
