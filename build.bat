@echo off

if exist ".\temp" goto :update
if not exist ".\temp" goto :fresh

:fresh
  rmdir temp /s/q
  rmdir build\frontend /s/q
  rmdir build\dist /s/q

  git clone https://github.com/IzK-ArcOS/ArcOS-Frontend temp
  
  cd temp
  
  goto :run

:update
  rmdir build\frontend /s/q
  rmdir build\dist /s/q
  
  cd temp
  
  git pull
  
  goto :run

:run
  call npm install --force
  call npx vite build --outDir ..\build\frontend
  
  cd ..\build
  
  call npx electron-builder build --x64