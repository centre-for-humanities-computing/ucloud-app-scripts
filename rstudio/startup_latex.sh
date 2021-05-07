#!/usr/bin/env bash

# replace settings file
SCRIPT_DIR="$(dirname $(readlink -f $0))"
FILE="rstudio-prefs.json"
TARGET="$SCRIPT_DIR/$FILE"
if test -f "$TARGET"; then
  echo "updating $FILE..."
  cp $TARGET /home/ucloud/.config/rstudio/rstudio-prefs.json
else
  echo "creating $FILE..."
  cp /home/ucloud/.config/rstudio/rstudio-prefs.json $TARGET
fi

# latex update
## add/change packages in TEX_LIVE_BACKUP_DIR
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi
TEX_LIVE_BACKUP_DIR="$SCRIPT_DIR/tex-backup"
TEX_LIVE_INSTALL="fancyvrb epstopdf-pkg infwarerr grfext kvdefinekeys kvoptions lt>"
if [ -d "$TEX_LIVE_BACKUP_DIR" ]; then
    echo "restoring text live backup..."
    tlmgr restore --all --backupdir "$TEX_LIVE_BACKUP_DIR"
else
    echo "installing tex live libs..."
    tlmgr install "$TEX_LIVE_INSTALL"
    mkdir -p "$TEX_LIVE_BACKUP_DIR"
    echo "creating tex live backup..."
    tlmgr backup --all --backupdir "$TEX_LIVE_BACKUP_DIR"
fi

rstudio-server restart
