@echo off
echo Hi
REM FOR /F "usebackq delims=" %%G IN (%1) DO (echo. & <nul set /p any-variable-name=%%G & grep -l %%G %2 > genietemp.txt & <nul set /p any-variable-name=appears in & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (<nul set /p any-variable-name=%%H) > genieresult.txt)
REM exit
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (CALL :grepper %%G %%H)
echo. > genieresults.txt
FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 | sed -n '1p' > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (echo %%G appears in %%H >> genieresults.txt))
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (echo %%G : %%H))
REM IF [%%H]==[] echo Nope ELSE echo YUP)
REM echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)
REM FOR /F %%G IN (%1) DO (echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)