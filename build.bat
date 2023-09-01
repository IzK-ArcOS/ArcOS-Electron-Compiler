@echo on

if exist ".\temp" goto :update
if not exist ".\temp" goto :fresh

:fresh
  rmdir temp /s/q >nul
  rmdir build\frontend /s/q >nul
  rmdir build\dist /s/q >nul

  git clone https://github.com/IzK-ArcOS/ArcOS-Frontend temp
  
  cd temp
  
  goto :run

:update
  rmdir build\frontend /s/q >nul
  rmdir build\dist /s/q >nul
  
  cd temp
  
  git pull
  
  goto :run

:run
  call npm install --force
  call npx vite build --outDir ..\build\frontend
  
  echo desktop >..\build\frontend\desktop
  git rev-parse --verify HEAD >..\build\frontend\build

  cd ..\build
  
  call npx electron-builder build --x64