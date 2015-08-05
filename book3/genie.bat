echo off
echo Hi

echo x > geniefilelist.txt
echo x > genietofindlist.txt
echo x > genieresults.txt

ls "E:\Projects\Jobs\SATM\assetset\audioset" >> genietofindlist.txt

ls "E:/Projects/Jobs/SATM/assetset/audioset/*.mp3" >> geniefilelist.txt

ls *.lua | grep "page_" | cut -c1-20 >> geniefilelist.txt

FOR /F "usebackq delims=" %%G IN (genietofindlist.txt) DO (echo %%G & grep -l %%G *.lua | sed -n '1p' > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (echo %%G appears in %%H >> genieresults.txt && echo %%G >> genieneeds.txt))

FOR /F "usebackq delims=" %%G IN (genieneeds.txt) DO (cp -n "E:/Projects/Jobs/SATM/assetset/audioset/%%G" "E:/Projects/Jobs/SATM/src/book3/audio/%%G")

cat genieresults.txt

REM FOR /F "usebackq delims=" %%G IN (genietofindlist.txt) DO echo %%G
REM end
REM FOR /F "usebackq delims=" %%G IN (%1) DO (echo. & <nul set /p any-variable-name=%%G & grep -l %%G %2 > genietemp.txt & <nul set /p any-variable-name=appears in & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (<nul set /p any-variable-name=%%H) > genieresult.txt)
REM exit
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (CALL :grepper %%G %%H)
REM FOR /F "usebackq delims=" %%G IN (%1) DO (grep -l %%G %2 > genietemp.txt & FOR /F "usebackq delims=" %%H IN (genietemp.txt) DO (echo %%G : %%H))
REM IF [%%H]==[] echo Nope ELSE echo YUP)
REM echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)
REM FOR /F %%G IN (%1) DO (echo %%G & echo. >> genieresults.txt && echo %%G >> genieresults.txt & echo ' yup ' >> genieresults.txt & grep -l %%G %2 >> genieresults.txt)