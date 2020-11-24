#!/bin/sh

set -e

bin/gcloud-authenticate.sh

PROJECT_ID='batect-keras-demo'
BUCKET_NAME='batect-keras-demo'
REGION='australia-southeast1'

JOB_DIR="gs://$BUCKET_NAME/keras-job-dir"
JOB_NAME="train_model_job_$(date +%s)" # TODO: replace with TAG

gcloud ai-platform jobs submit training $JOB_NAME \
  --project $PROJECT_ID \
  --package-path src/trainer \
  --module-name trainer.task \
  --region $REGION \
  --python-version 3.7 \
  --runtime-version 1.15 \
  --job-dir $JOB_DIR \
  -- \
  --num-epochs 5 \
  --job-name $JOB_NAME

