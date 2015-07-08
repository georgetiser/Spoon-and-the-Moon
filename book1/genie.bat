@echo off
echo Hi
FOR /F "usebackq delims=" %%G IN (%1) DO (echo. & <nul set /p any-variable-name=%%G & grep -l %%G %2 > genietemp.txt & <nul set /p any-variable-name=appears in & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (<nul set /p any-variable-name=%%H))
del genietemp.txt
exit

REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (CALL :grepper %%G %%H)
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (echo %%G appears in %%H))
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > gtemp.txt & FOR /F "usebackq delims=" %%H IN (gtemp.txt) DO (echo %%G : %%H))
REM grep -l %%G %2 > %%var%% & ECHO %%var%%)
REM IF [%%H]==[] echo Nope ELSE echo YUP)
REM echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)
REM FOR /F %%G IN (%1) DO (echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)