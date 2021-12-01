#!/bin/bash
#SBATCH --partition=compute
#SBATCH --job-name=bf2zarr
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=32G
#SBATCH --time=00:20:00

usage="$(basename "$0") [-h] [-i input_file -o output_zarr -b bf2raw] -- \
Convert a single image file to zarr.

Note that slurm submission parameters may need to be adjusted in the script for batch jobs. Note also that bioformats2raw parameters may need to be adjusted in the script depending on image shape and compression options.

where:
    -h  show this help text
    -i  path to original image file
    -o  path to output zarr
    -b  path to bioformats2raw singularity container
"

##Parse arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    -i) input_file="$2"; shift 2;;
    -o) output_zarr="$2"; shift 2;;
    -b) bf2raw="$2"; shift 2;;
    -h) echo "$usage"; exit 0;;
    -*) echo "unknown option: $1" >&2; exit 1;;
    **) break;;
  esac
done

# Error if missing arguments
if [ -z "$input_file" ]; then
  echo "ERROR: missing path to input image file to be converted"
  echo "$usage"
  exit 1
fi

if [ -z "$output_zarr" ]; then
  echo "ERROR: no output zarr path specified"
  echo "$usage"
  exit 1
fi

output_dir=$(dirname $output_zarr)
mkdir -p $output_dir

if [ -z "$bf2raw" ]; then
  echo "ERROR: path to bioformats2raw container required"
  echo "$usage"
  exit 1
fi

# running the script
module load singularity
$bf2raw $input_file $output_zarr --no-nested -w 4096 -h 4096 -c blosc --overwrite --max_workers=32 --max_cached_tiles=256
