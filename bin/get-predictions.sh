#!/bin/sh

set -e

bin/gcloud-authenticate.sh

PROJECT_ID='batect-keras-demo'
MODEL_NAME='my_keras_model'
MODEL_VERSION="v_$JOB_NAME"


INPUT_DATA_PATH='data/prediction_input.json'
echo "Generating predictions for input data at $INPUT_DATA_PATH)..."
gcloud ai-platform predict \
  --project $PROJECT_ID \
  --model $MODEL_NAME \
  --version $MODEL_VERSION \
  --json-instances $INPUT_DATA_PATH