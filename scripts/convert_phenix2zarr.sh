#!/bin/bash
#SBATCH --partition=compute
#SBATCH --job-name=plate2zarr
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64G
#SBATCH --time=1:00:00

usage="$(basename "$0") [-h] [-i plate_index -o output -b container] -- \
Convert a Phenix plate to zarr

where:
    -h  show this help text
    -i  path to plate index file (Index.idx.xml)
    -o  full path to output zarr
    -b  path to bioformats2raw singularity container
"

##Parse arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    -i) plate_index="$2"; shift 2;;
    -o) output="$2"; shift 2;;
    -b) bf2raw="$2"; shift 2;;
    -h) echo "$usage"; exit 0;;
    -*) echo "unknown option: $1" >&2; exit 1;;
    **) break;;
  esac
done

# Error if missing arguments
if [ -z "$plate_index" ]; then
  echo "ERROR: missing path to index file for plate to be converted"
  echo "$usage"
  exit 1
fi

if [ -z "$output" ]; then
  echo "ERROR: no output file specified"
  echo "$usage"
  exit 1
fi

if [ -z "$bf2raw" ]; then
  echo "ERROR: path to bioformats2raw container required"
  echo "$usage"
  exit 1
fi

# running the script
export JAVA_OPTS='-Xms64g -Xmx128g'
module load singularity
"$bf2raw" "$plate_index" "$output" -w 1080 -h 1080 -z 10 -c blosc --no-nested --max_workers 32 
