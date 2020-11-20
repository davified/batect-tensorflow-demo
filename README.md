# Tensorflow batect demo

## Prerequisites

- Docker

## Setup

```shell script
# install dependencies
./batect setup # this will take a couple of minutes when it's first run, but batect.yml specifies some caching so subsequent runs will be faster 

# train model locally
./batect train_model

# start jupyter server (if you need it for your workflow)
./batect start_jupyter

```


## Instructions for setting up your own GCP project
- https://cloud.google.com/ai-platform/docs/getting-started-keras#set_up_your_project
- Continue deploying keras model here: https://cloud.google.com/ai-platform/docs/getting-started-keras#quickstart-training