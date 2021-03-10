#!/bin/sh -l

hash=$(aws ecr describe-images --repository-name $REPOSITORY_NAME | jq '.imageDetails | .[].imageTags | select(index( "latest" )) | .[] | select(. != "latest")')
echo "::set-output name=hash::$hash"
