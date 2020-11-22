#!/bin/sh

set -e

echo "Creating virtual environment if none exists..."
python3 -m venv .venv

echo "Activating virtual environment..."
. .venv/bin/activate

echo "Installing python dependencies..."
pip install --upgrade pip
pip install -r requirements-dev.txt