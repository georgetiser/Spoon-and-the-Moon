@echo off
echo Restoring files that were deleted since last commit.
git ls-files --deleted > tempfiles.txt
FOR /F "usebackq delims=" %%G IN (tempfiles.txt) DO (echo %%G & git checkout %%G)
del tempfiles.txt
exit