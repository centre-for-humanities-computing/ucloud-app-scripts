#!/usr/bin/env bash
RENVNAME=r_ts_kernel
eval "$(conda shell.bash hook)"
conda activate ./$RENVNAME
R -e "IRkernel::installspec(name = '$RENVNAME', displayname = '$RENVNAME')"
