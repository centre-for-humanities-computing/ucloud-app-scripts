#!/usr/bin/env bash
RENVNAME=r_ts_kernel
conda create --prefix /work/$RENVNAME
eval "$(conda shell.bash hook)"
conda activate ./$RENVNAME
conda install -y r-tsibble r-forecast r-fable r-tsibbledata r-feasts r-fable.prophet
R -e "IRkernel::installspec(name = '$RENVNAME', displayname = '$RENVNAME')"
