#!/bin/bash
# Copyright (C) 2012, 2022  Anders Gidenstam  (anders(at)gidenstam.org)
# This file is licensed under the GPL license version 2 or later.
#
# Usage: run_experiment.sh <base dir> <name base>

# Setup paths for gerris.
#export PATH=$PATH:/home/anders/FlightGear/gerris/201207/bin
#export PKG_CONFIG_PATH=/home/anders/FlightGear/gerris/201207/lib/pkgconfig

BASEDIR=$1
BASE=$2

cd ${BASEDIR}

for dir in ${2}*; do
  (cd ${dir}; rm f; gerris3D buoyancy3D.gfs)
done;
