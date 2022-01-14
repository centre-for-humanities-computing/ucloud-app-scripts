#!/usr/bin/env bash
VENVNAME=titanic_venv
source $VENVNAME/bin/activate
python -m ipykernel install --user --name $VENVNAME --display-name "$VENVNAME"