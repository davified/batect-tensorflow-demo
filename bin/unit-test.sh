#!/bin/sh

set -e

echo "Activating virtual environment..."
. /code/.venv-dev/bin/activate

python -m unittest discover ./tests/