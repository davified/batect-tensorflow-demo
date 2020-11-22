#!/bin/sh

set -e

PROJECT_ID='batect-keras-demo'

BUCKET_NAME="$PROJECT_ID" # may need to make this unique if bucket name is already taken
REGION='asia-northeast1'

echo "Authenticating using service account credentials: $GOOGLE_APPLICATION_CREDENTIALS"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

MODEL_NAME="my_keras_model"

gcloud ai-platform models create $MODEL_NAME \
  --project $PROJECT_ID \
  --regions $REGION
