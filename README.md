### User's guide ###
## Model compilation ##
The installation of ALBM requires Fortran compiler.
Please change the NETCDF_HOME path in file 'make.sh' to where directory Pnetcdf_openmpi_2.1.6/ is.
To compile the model, type
        ./make.sh
This creates an executable file 'ALBM'.

## Running the model ##
Running the model requires an input namelist file, e.g. 'namelist1.bLake' in the example. The model 
can be launch at the console by first loading the openmpi lilbrary
        module load openmpi/2.1.6
and then typing
        mpirun -np 200 ALBM namelist1.bLake
However, most of the time, the model is run by submitting a job to the cluster, e.g.
        sbatch blakeJob1.sub

## Model output ##
The model has 3 modes: simulation, calibration and senstivity defined in the namelist file.
In the simulation mode, the model outputs simulation result files in the format of 
'bLakeOut.<varname>.<starttime>_<endtime>.nc'.
In the calibration mode, the model automatically reads the observation files under Observations/
and calculates the cost fucntions for each variable defined by 'obs_var' in the namelist. The output 
file is 'SA.nc' that contains all the cost function results. Users can also choose to output all the 
calibration results by searching for 'Uncomment if want output all calibration results' in the file
'bayesian_mod.f90' and uncomment lines accordingly.
In the sensitivity test mode, the model calculates the mean of each variable defined by
'obs_var' and output the values to file 'SA.nc'. 
