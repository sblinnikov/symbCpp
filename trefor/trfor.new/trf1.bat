@echo off
if "%1" == "" goto NONAME
If EXIST %1.TRF goto NAME
If EXIST %1     goto EXTENSION
echo File %1 not found.
goto END
:EXTENSION
  if "%TMP%" == "" goto NOTMPE
     echo "Create TREFOR listing & FORTRAN file at %TMP% directory."
     goto TREFORE
  :NOTMPE
     echo "Create TREFOR listing & FORTRAN file at your directory."
  :TREFORE
     trefor %1 %TMP% 1
goto END
:NAME
  trefor %1.trf %TMP% 1
  if errorlevel 5 goto end
  if "%TMP%" == "" goto NOTMP
    fl /c /Fo%1.obj %Tmp%\%1.for
    if errorlevel 1 goto end
    del %TMP%\%1.for
    del %TMP%\%1.lst
    goto END
  :NOTMP
    fl /c /Fo%1.obj %1.for
    if errorlevel 1 goto end
    del %1.for
    del %1.lst
    goto END
:NONAME
  echo Missing File Name.
:end

