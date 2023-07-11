const { app, BrowserWindow, globalShortcut } = require("electron");
const { readFile } = require("fs/promises");

let win;

app.on("ready", async () => {
  win = new BrowserWindow({
    width: 1000,
    height: 720,
    minWidth: 1000,
    minHeight: 720,
    backgroundColor: "#000",
    title: "ArcOS",
    center: true,
    resizable: true,
    fullscreenable: true,
    icon: await getIcon(),
  });

  globalShortcut.register("Alt+Enter", () => {
    if (win.isFocused()) {
      if (BrowserWindow.getFocusedWindow().fullScreen == true) {
        BrowserWindow.getFocusedWindow().fullScreen = false;
      } else {
        BrowserWindow.getFocusedWindow().fullScreen = true;
      }
    }
  });

  globalShortcut.register("Control+Shift+I", () => {
    if (win.isFocused()) {
      win.toggleDevTools();
    }
  });

  globalShortcut.register("Control+Alt+Shift+R", () => {
    if (win.isFocused()) {
      loadStartPage();
    }
  });

  globalShortcut.register("Control+R", () => {
    if (win.isFocused()) {
      win.webContents.reload();
    }
  });

  win.removeMenu();

  win.loadFile("frontend/index.html");

  win.on("maximize", () => {
    win.unmaximize();
    setTimeout(() => {
      win.fullScreen = true;
    }, 50);
  });
});

async function getIcon() {
  try {
    const mode = await readFile(`${__dirname}/frontend/mode`, {
      encoding: "utf-8",
    });

    return `${__dirname}/ico/${mode}.png`;
  } catch {
    return `${__dirname}/ico/release.png`;
  }
}
