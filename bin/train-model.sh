#!/bin/sh

set -e

#apt-get update
#apt-get install -y python3-venv

echo "Activating virtual environment..."
. /code/.venv-dev/bin/activate

python src/train.py