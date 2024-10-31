#!/bin/bash

# Deploy actions for deploying as an image to Google Cloud

source .env

for VAR in PROJECT HOST_REGION REPO TAG
	do [ -z "${!VAR}" ] && echo "\nERROR: $VAR not set (expected to be in .env file)\n" && exit 1
done

CMDS="deploy"

if [ -z "$1" ]
    then echo "nERROR: No command provided. Available commands: $CMDS" && exit 1
fi

deploy() {
    echo "Build image for Google Cloud Artifact Registry $PROJECT / $REPO / $TAG..."

	TAG=$HOST_REGION-docker.pkg.dev/$PROJECT/$REPO/$TAG

	docker build --platform linux/amd64 -t $TAG .
	docker push $TAG
}

case "$1" in
    deploy)
        deploy
        ;;
    *)
        echo "nERROR: Invalid command. Available commands: $CMDS" && exit 1
        ;;
esac
