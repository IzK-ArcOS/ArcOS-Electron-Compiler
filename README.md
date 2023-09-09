# ArcOS Electron Compiler

This repository clones the latest ArcOS frontend and compiles redistributables for users to install on their system. Current compatibility has been checked to comply with Windows, MacOS and Linux systems.

> **NOTE**: ArcOS ESR can be found in the [`esr`](https://github.com/IzK-ArcOS/ArcOS-Electron-Compiler/tree/esr/) branch of this repository.

## Getting started

Before you get started, please make sure you have the prerequisites installed on your system:

- Git SCM ([Link](https://git-scm.com/downloads))
- NodeJS and NPM ([Link](https://nodejs.org/))

### Linux and MacOS: Update NodeJS!

You must first update NodeJS before attempting to compile ArcOS Desktop.

```bash
$ sudo npm i -g n
$ sudo n latest
```

## Creating a redistributable

To get started, clone the IzK-ArcOS/ArcOS-Electron-Compiler repository:

```bash
git clone https://github.com/IzK-ArcOS/ArcOS-Electron-Compiler
```

Next there are two seperate build scripts you can use, depending on your operating system.

- For Linux and MacOS systems, use:
  ```bash
  $ ./build.sh
  ```
- For Windows systems, use:
  ```bat
  > .\build.bat
  ```

Once the process has completed without any errors you can check `./build/dist` for the outputted files:
| Operating System | Filename |
|----------------------------|-------------------------------------------------------------|
| Windows | `ArcOS Desktop Setup X.X.X.exe` |
| Debian | `arcos-desktop_X.X.X_amd64.deb` |
| Other linux distributions | `ArcOS Desktop-X.X.X.AppImage`,`ArcOS Desktop-X.X.X.tar.xz` |
| MacOS | `ArcOS Desktop-X.X.X.dmg` |

## License

MIT
