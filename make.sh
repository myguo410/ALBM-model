#! /bin/bash

##-----------------------------------------------------------------------
## Default ALBM Build
##------------
##

module unload netcdf/4.5.0 
module unload impi/2017.1.132

export NETCDF_HOME=/home/guo410/packages/Pnetcdf_openmpi_2.1.6
export LD_LIBRARY_PATH=$NETCDF_HOME/lib:$LD_LIBRARY_PATH

arg=$( echo $1 | tr '[:upper:]' '[:lower:]' )
if [ -z "$arg" ]; then
   gmake -j8
elif [ $arg = 'clean' ]; then
   gmake $arg -j8
elif [ $arg = 'debug' ]; then
   gmake DEBUG=1 -j8
else
   echo "Wrong Argument: $1!!!"
fi
