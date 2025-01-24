@echo off
call setEnv.bat
"D:\MatLab\R2022a\toolbox\shared\coder\ninja\win64\ninja.exe" -t compdb cc cxx cudac > compile_commands.json
"D:\MatLab\R2022a\toolbox\shared\coder\ninja\win64\ninja.exe" -v %*
