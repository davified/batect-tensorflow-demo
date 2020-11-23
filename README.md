# Tensorflow batect demo

## Prerequisites

- Docker
- Java (used by batect. you'll not be seeing Java code - I promise)

## Setup

```shell script
# install dependencies
./batect setup # this will take a couple of minutes when it's first run, but batect.yml specifies some caching so subsequent runs will be faster 

# run unit tests
./batect unit_test

# train model locally
./batect train_model
```

## Deploying the model

If you'd like to train and deploy the model to Google Cloud Platform, you'll need to follow [these instructions](https://cloud.google.com/ai-platform/docs/getting-started-keras#set_up_your_project) to:
- Create a new GCP project
- Enable billing and some APIs
- Create a service account and **download the service account's credentials to the `./credentials` directory in this repo**
- **In `batect.yml`, update GOOGLE_APPLICATION_CREDENTIALS to `/code/credentials/YOUR_KEY.json`**

```shell script
# train model on GCP
./batect train_model_on_gcloud
# view job progress and logs at https://console.cloud.google.com/ai-platform/dashboard?project=YOUR_PROJECT_ID
# view model artifacts at your GCS bucket: https://console.cloud.google.com/storage/browser/

# create model resource
./batect create_model_resource

# deploy model version
./batect deploy_model -- REPLACE_ME_WITH_JOB_NAME 
# you can find this in the terminal output of the ./batect train_model_on_gcloud command 
# (e.g. ./batect deploy_model -- train_model_job_1606023193)

# your model is live here! https://console.cloud.google.com/ai-platform/models?project=batect-keras-demo 
# (select the region that you used in bin/create-model-resource.sh)  
```

## Other things you can do 
```shell script
# launch tensorboard
./batect launch_tensorboard # visit http://localhost:6006 on your browser

# start jupyter server (if you need it for your workflow)
./batect start_jupyter
```

## Clean up
- To avoid unnecessary GCP charges, remember to clean up all Google Cloud resources used in this project: https://cloud.google.com/ai-platform/docs/getting-started-keras#cleaning_up


# TODOs:
- [x] Update README about credentials
- [x] add unit test script
- [x] add tensorboard command
- add CI
- refactor shell scripts
- [x] draw diagram for batect
    - what you want to do (e.g. python train.py)
    - run in a docker container
    - batect command
    - callers of batect: developers, CI

