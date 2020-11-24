#!/bin/sh

set -e

bin/create-model-resource.sh

PROJECT_ID='batect-keras-demo'
MODEL_NAME="my_keras_model"
JOB_DIR='gs://batect-keras-demo/keras-job-dir'

# Get a list of directories in the `keras_export` parent directory. Then pick
# the directory with the latest timestamp, in case you've trained multiple times.
SAVED_MODEL_PATH="$JOB_DIR/keras_export/$JOB_NAME"

echo "SAVED_MODEL_PATH: $SAVED_MODEL_PATH"

# Create model version based on that SavedModel directory
MODEL_VERSION="v1"
gcloud ai-platform versions create $MODEL_VERSION \
  --project $PROJECT_ID \
  --model $MODEL_NAME \
  --runtime-version 1.15 \
  --python-version 3.7 \
  --framework tensorflow \
  --origin $SAVED_MODEL_PATH