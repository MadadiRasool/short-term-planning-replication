#!/bin/bash
python --version

conda info
# python run.py
echo -e 'Start Get Date'
python scripts/01-construct-estimation-data.py
echo -e 'End Get Date'
python scripts/02-construct-fortran-models.py

# python print("Start Create Fortran Models")
# python scripts/02-construct-fortran-models.py

# python print("Start Create BaseLine Models")
# python scripts/03-estimate-baseline-models.py --model canonical_NK --nprocs 4
