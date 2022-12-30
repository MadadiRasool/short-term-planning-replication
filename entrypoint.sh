#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# # enabling Conda.

# # Enable strict mode.
# set -euo pipefail
# # ... Run whatever commands ...

# # Temporarily disable strict mode and activate conda:
# set +euo pipefail
# conda activate short-term-planning-replication

# # Re-enable strict mode:
# set -euo pipefail

python --version




# python run.py
echo -e 'Start Get Date'
python scripts/01-construct-estimation-data.py
echo -e 'End Get Date'


python print("Start Create Fortran Models")
python scripts/02-construct-fortran-models.py
python print("End Create Fortran Models")

python print("Start Estimate BaseLine Models")
python scripts/03-estimate-baseline-models.py --model canonical_NK --nprocs 4
python print("End Estimate BaseLine Models")

python print("Start Create Tables")
python scripts/05-fig-impulse-response-disinflation-shock.py           
python print("End Create Tables")
