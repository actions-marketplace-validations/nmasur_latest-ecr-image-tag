#!/bin/sh -l

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
AWS_REGION=$3
REPOSITORY_NAME=$4

hash=$(AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY aws ecr describe-images --repository-name $REPOSITORY_NAME --region $AWS_REGION | jq '.imageDetails | .[].imageTags | select(index( "latest" )) | .[] | select(. != "latest")')
echo "::set-output name=hash::$hash"
