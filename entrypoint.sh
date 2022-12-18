#!/bin/bash
python print("Start Get Data ... ")
python scripts/01-construct-estimation-data.py

python print("Start Create Fortran Models")
python scripts/02-construct-fortran-models.py

python print("Start Create BaseLine Models")
python scripts/03-estimate-baseline-models.py --model canonical_NK --nprocs 4
