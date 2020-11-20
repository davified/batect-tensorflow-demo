#!/bin/sh

set -e

apt-get update
apt-get install -y python3-venv

echo "Creating virtual environment..."
python -m venv /code/.venv-dev

echo "Activating virtual environment..."
. /code/.venv-dev/bin/activate

echo "Installing python dev dependencies..."
pip install --upgrade pip
pip install -r requirements-dev.txt
