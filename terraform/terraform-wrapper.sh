#!/bin/bash

# arguments
## user-defined
CMD=$1
OPTIONS=$2

## default
AWS_CREDENTIALS_PATH=.aws/credentials
SSH_KEY_PATH=.ssh/aws.pem
WORKDIR_HOST=`pwd`/aws
WORKDIR_GUEST=/tmp/jenkins-master

# runs terraform
docker run \
    --rm \
    -i \
    -t \
    -v $WORKDIR_HOST:$WORKDIR_GUEST \
    -v $HOME/$AWS_CREDENTIALS_PATH:/root/$AWS_CREDENTIALS_PATH \
    -v $HOME/$SSH_KEY_PATH:$WORKDIR_GUEST/$SSH_KEY_PATH \
    --workdir=$WORKDIR_GUEST \
    hashicorp/terraform:light \
        $CMD \
        $OPTIONS
