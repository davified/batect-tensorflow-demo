#!/bin/sh

set -e

echo "Activating virtual environment..."
. /code/.venv-dev/bin/activate

unique_job_name=$(date +%s)

python -m src.trainer.task --job-dir local-training-output --num-epochs 5 --job-name $unique_job_name