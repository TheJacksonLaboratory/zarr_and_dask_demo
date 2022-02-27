# Zarr and Dask for Large-scale Image Data 

## Sumner instructions

### Launch an interactive session for the March 3, 2022 workshop

`srun -p RIT_CI_Only -q rit_test -A dask_class -c 32 --mem=320GB --time=08:00:00 --pty bash`

### Launch an interactive session on the dev partition

Note: I stop short of grabbing all of the resources of a node, because I like to be able to start a second job on the same node for small tasks.

`srun -p dev -q dev --mem 160G -c 28 -t 2:00:00 --pty bash`

## Where to find examples

Example data and containers can be found here:

`/projects/researchit/djme/zarr_dask_examples`

## Where to find documentation
