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

./compiler.sh no-e