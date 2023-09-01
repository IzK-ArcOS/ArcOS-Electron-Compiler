#!/bin/bash

function update() {
    rm -r ./build/frontend
    rm -r ./build/dist
    
    cd temp
    
    git pull
    
    run
}

function fresh() {
    rm -r ./temp
    rm -r ./build/frontend
    rm -r ./build/dist
    
    git clone https://github.com/IzK-ArcOS/ArcOS-Frontend temp
    
    cd temp
    
    run
}

function run() {
    npm install --force
    npx vite build --outDir ../build/frontend
    
    echo "desktop" > ../build/frontend/desktop
    git rev-parse --verify HEAD > ../build/rontend/build
    
    cd ../build
    
    npm install
    
    case "$(uname -sr)" in
        
        Darwin*)
            npx electron-builder build --x64 --mac dmg
        ;;
        
        *)
            npx electron-builder build --x64 --linux deb appimage tar.xz rpm
        ;;
    esac
}

if [ -d "./temp" ]; then
    update
else
    fresh
fi