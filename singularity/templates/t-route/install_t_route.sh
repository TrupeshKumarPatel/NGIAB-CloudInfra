#!/bin/bash

current_path=`pwd`

echo "==========================================================="
echo "-- Now loding modules ..."
echo "-----------------------------------------------------------"
source /etc/profile.d/modules.sh
module load mpi
module list

echo "==========================================================="
echo "==========================================================="

echo ""
echo "==========================================================="
echo "-- Now Cloning and Installing NOAA-OWP T-Route ..."
echo "-----------------------------------------------------------"
# export FC=gfortran NETCDF=/usr/include
git clone --progress --single-branch --branch master http://github.com/NOAA-OWP/t-route.git
cd t-route
cp /tmp/t-route/compiler.sh .
cp /tmp/t-route/src/troute-network/setup.py src/troute-network/setup.py
cp /tmp/t-route/src/troute-network/troute/nhd_io.py src/troute-network/troute/nhd_io.py
cp /tmp/t-route/src/troute-routing/setup.py src/troute-routing/setup.py

./compiler.sh

