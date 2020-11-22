#!/bin/sh

set -e

PROJECT_ID='batect-keras-demo'
MODEL_NAME='my_keras_model'
MODEL_VERSION='v1'

echo "Authenticating using service account credentials: $GOOGLE_APPLICATION_CREDENTIALS"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

INPUT_DATA_PATH='data/prediction_input.json'
echo "Generating predictions for input data at $INPUT_DATA_PATH)..."
gcloud ai-platform predict \
  --project $PROJECT_ID \
  --model $MODEL_NAME \
  --version $MODEL_VERSION \
  --json-instances $INPUT_DATA_PATH