# Zarr and Dask for Large-scale Image Data 

## Sumner instructions


#### Launch an interactive session for the March 3, 2022 workshop

_Note_: You should _only_ use this command for the workshop. See the section on launching an interactive session on the dev partition below for future reference.

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

#### Zarr documentation

1) [zarr.convenience.open](https://zarr.readthedocs.io/en/stable/api/convenience.html#zarr.convenience.open) - For opening zarrs on a conventional file system or S3 bucket, for example.
2) [zarr.storage](https://zarr.readthedocs.io/en/stable/api/storage.html) - If you want to write zarrs from Pyton (not really covered in this tutorial).
3) [zarr.core.Array](https://zarr.readthedocs.io/en/stable/api/core.html) - Class methods and attributes that can be used when working with zarrs.

#### Dask documentation

1) [dask.array.from\_zarr](https://docs.dask.org/en/stable/generated/dask.array.from_zarr.html#dask.array.from_zarr) - Create a dask array from a zarr.
2) [dask.array.Array](https://docs.dask.org/en/stable/generated/dask.array.Array.html#dask.array.Array) - Class methods and attributes that can be used when working with dask arrays.
3) [dask.array](https://docs.dask.org/en/stable/array-api.html#top-level-functions) - Top-level functions that can be applied to any dask array.

#### Dask-image documentation

1) [dask\_image API](http://image.dask.org/en/latest/api.html) - Image processing functions designed for use with dask arrays.
