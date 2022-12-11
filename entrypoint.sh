# python3 print(test)
# python scripts/03-estimate-baseline-models.py --model canonical_NK --nprocs 4

#!/bin/bash
set -x
while $1
do
    echo "Press [CTRL+C] to stop.."
    sleep 5
    echo "My second and third argument is $2 & $3"
done