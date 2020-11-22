#!/bin/sh

set -e

PROJECT_ID='batect-keras-demo'

BUCKET_NAME="$PROJECT_ID" # may need to make this unique if bucket name is already taken
REGION='australia-southeast1'

echo "Authenticating using service account credentials: $GOOGLE_APPLICATION_CREDENTIALS"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

echo "Creating bucket: $BUCKET_NAME"
gsutil mb -l $REGION -p $PROJECT_ID gs://$BUCKET_NAME || true # TODO: check if bucket exists before creating
