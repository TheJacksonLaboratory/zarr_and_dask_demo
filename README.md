# Zarr and Dask for Large-scale Image Data 

## Sumner instructions


#### Launch an interactive session for the March 3, 2022 workshop

_Note_: You should _only_ use this command for the workshop. See the section on launching of the dev partition below for future reference.

`srun -p RIT_CI_Only -q rit_test -A dask_class -c 32 --mem=320GB --time=08:00:00 --pty bash`


#### Launch an interactive session on the dev partition

Note: I stop short of grabbing all of the resources of a node, because I like to be able to start a second job on the same node for small tasks.

`srun -p dev -q dev --mem 160G -c 28 -t 2:00:00 --pty bash`


#### Lunch jupyter notebook

_Important!_: If you get an error about the port being in use, increment by 1 and try again.

```
module load singularity
export SINGULARITY_BIND="/projects,/home"
/projects/researchit/djme/zarr_dask_examples/containers/dask_python.sif jupyter-lab --no-browser --ip=$(hostname -i) --port=8888
```

## Where to find examples

Example data and containers can be found here:

`/projects/researchit/djme/zarr_dask_examples`

## Where to find documentation
