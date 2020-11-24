#!/bin/sh

set -e

bin/gcloud-authenticate.sh

PROJECT_ID='batect-keras-demo'
BUCKET_NAME="$PROJECT_ID" # may need to make this unique if bucket name is already taken
REGION='asia-northeast1'

MODEL_NAME="my_keras_model"

model_status_code=$(gcloud ai-platform models list --project $PROJECT_ID | grep -c ${MODEL_NAME} || true) # 1 if model exists, 0 otherwise
if [ ${model_status_code} == 0 ]; then
  echo "Creating model resource (i.e. a container for all versions of this model) for: $MODEL_NAME"
  gcloud ai-platform models create $MODEL_NAME \
    --project $PROJECT_ID \
    --regions $REGION
else
  echo "Model resource for $MODEL_NAME already exists. Skipping..."
fi