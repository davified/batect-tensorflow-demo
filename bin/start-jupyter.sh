#!/bin/sh

set -e

. /code/.venv-dev/bin/activate

jupyter notebook --ip 0.0.0.0 --allow-root