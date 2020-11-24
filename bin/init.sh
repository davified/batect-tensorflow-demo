#!/bin/sh

set -e

bin/gcloud-authenticate.sh

PROJECT_ID='batect-keras-demo'
BUCKET_NAME="$PROJECT_ID" # may need to make this unique if bucket name is already taken
REGION='australia-southeast1'

echo "Creating bucket: $BUCKET_NAME"
gsutil mb -l $REGION -p $PROJECT_ID gs://$BUCKET_NAME || true # TODO: check if bucket exists before creating
