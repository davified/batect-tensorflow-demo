#!/bin/sh

set -e

tensorboard --logdir ./local-training-output --bind_all
