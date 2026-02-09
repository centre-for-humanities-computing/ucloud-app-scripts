# UCloud APP Scripts #

```bash
├── jupyter
├── README.md
├── rstudio
│   └── startup_latex.sh
└── vscode
```

## RStudio Set-up ##

1. add/change packages in `TEX_LIVE_INSTALL` in `startup_latex.sh`
2. copy the `startup_latex.sh` and your `rstudio-prefs.json` to your working directory
3. run `startup_latex.sh` from the terminal
```bash
sudo -E env "PATH=$PATH" bash startup_latex.sh
```

## Gephi Set-up ##

1. Choose [Ubuntu VDE](https://docs.cloud.sdu.dk/Apps/ubuntu.html)
2. Add `gephi-vd.sh` as initialization parameter
3. Gephi is now available on the Desktop

## Orange

1. Choose [Ubuntu VDE](https://docs.cloud.sdu.dk/Apps/ubuntu.html)
2. Add `orange-vd.sh` as initialization parameter
3. From the Ubuntu Virtual Desktop start a terminal
4. Execute `python -m Orange.canvas` from the terminal

## AntConc

1. Choose [Ubuntu VDE](https://docs.cloud.sdu.dk/Apps/ubuntu.html)
2. Add `antconc-vd.sh` as initialization parameter
3. Execute `AntConc.sh` found in the Desktop
