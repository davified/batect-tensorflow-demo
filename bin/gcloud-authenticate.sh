#!/bin/sh

set -e

echo "Authenticating using service account credentials: $GOOGLE_APPLICATION_CREDENTIALS"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
