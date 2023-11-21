# syntax=docker/dockerfile:1
FROM rockylinux:9.2

# install app dependencies
RUN sed -i '$amax_parallel_downloads=10' /etc/dnf/dnf.conf
RUN dnf upgrade -y
RUN dnf update -y
RUN dnf install epel-release -y
RUN dnf config-manager --set-enabled crb
RUN dnf update --refresh -y
RUN dnf groupinstall 'Development Tools' -y
RUN dnf install tar git gcc-c++ gcc gcc-gfortran make cmake bzip2 python3 python3-devel python3-pip udunits2-devel -y
RUN cp -s /usr/bin/python3 /usr/bin/python
RUN dnf install sqlite sqlite-devel sqlite-libs libsqlite3x libsqlite3x-devel -y
RUN pip3 install wheel 
RUN pip3 install deprecated dask pyarrow geopandas pyproj fiona pandas xarray netCDF4==1.6.3 joblib toolz pyyaml Cython==3.0.3 bmipy opencv-contrib-python-headless
RUN dnf install libstdc++ libstdc++-devel glibc glibc-devel libgfortran openmpi openmpi-devel -y
RUN dnf --enablerepo=devel install texinfo -y
RUN dnf install netcdf netcdf-devel netcdf-fortran netcdf-fortran-devel netcdf-openmpi netcdf-openmpi-devel netcdf-fortran-openmpi netcdf-fortran-openmpi-devel -y 
RUN dnf install boost boost-devel -y
RUN dnf install lapack gdal-libs gdal gdal-devel -y

# Copy NGen install file to DockerImage
# ENV FC=gfortran 
# ENV NETCDF=/usr/include
COPY ./templates /tmp/
RUN chmod +x /tmp/ngen/install_ngen.sh /tmp/t-route/install_t_route.sh /tmp/netcdf/install_netcdf_cxx.sh /tmp/extern/install_extern_libraries.sh
RUN ./tmp/netcdf/install_netcdf_cxx.sh
RUN ./tmp/t-route/install_t_route.sh
RUN ./tmp/ngen/install_ngen.sh