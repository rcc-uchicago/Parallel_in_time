#!/bin/bash

 

#SBATCH --job-name=job

#SBATCH --partition=caslake
#SBATCH --account=rcc-staff
##SBATCH  --reservation=workshop_PINT
##SBATCH --cpus-per-task=4

#SBATCH --mem-per-cpu=1G

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=4

#SBATCH --time=01:00:00

echo "TEST"
#IPS_ROOT=/scratch/midway3/dsamaddar/ipsframework-code/framework
IPS_ROOT=/project/rcc/dsamaddar/Parallel_in_time/PR_workshop_2d_cond_MW3/ipsframework-code/framework

$IPS_ROOT/src/ips --config=/project/rcc/dsamaddar/Parallel_in_time/PR_workshop_2d_cond_MW3/Run_IPS/2D_cond/RCC_MW2/2dCond_parareal.conf --platform=$IPS_ROOT/workstation.conf --log=2dCond_sim.log


