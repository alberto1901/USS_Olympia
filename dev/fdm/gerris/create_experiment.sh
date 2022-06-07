#!/bin/bash
# Copyright (C) 2012, 2022  Anders Gidenstam  (anders(at)gidenstam.org)
# This file is licensed under the GPL license version 2 or later.
#
# Usage: create_experiment.sh <base dir> <name base>

#export PATH=$PATH:$HOME/FlightGear/gerris/bin

BASEDIR=$1
BASE=$2

# Hydrodynamic reference point [m].
HRPX=52.4256
HRPZ=0.0

# Water level below the HRP [m].
HAGL=$3

# Compute actual model offsets.
XOFFSET=`echo -$HRPX | bc`
ZOFFSET=`echo $HAGL-$HRPZ | bc`

#echo $ZOFFSET
#exit

if [ ! -d ${BASEDIR} ]
then
  mkdir ${BASEDIR}
fi
cd ${BASEDIR}

for roll in -4 -2 0 2 4; do
  for pitch in -4 -2 0 2 4; do
    dir=${BASE}_r${roll}_p${pitch}
    mkdir ${dir}
    transform --tx=$XOFFSET --tz=$ZOFFSET < ../hull.gts.base | transform --ry ${pitch} | transform --rx ${roll} -v > ${dir}/hull.gts

    (cd ${dir}; ln -s ../../buoyancy3D.gfs . )
  done;
done;
