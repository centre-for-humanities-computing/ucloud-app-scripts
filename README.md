# UCloud APP Scripts #

```bash
├── jupyter
├── README.md
├── rstudio
│   └── startup_latex.sh
└── vscode
```

## RStudio Set-up ##

1. add/change packages in `TEX_LIVE_BACKUP_DIR` in `startup_latex.sh`
2. copy the `startup_latex.sh` and your `rstudio-prefs.json` to your working directory
3. run `startup_latex.sh` from the terminal
```bash
sudo -E env "PATH=$PATH" startup_latex.sh
```
