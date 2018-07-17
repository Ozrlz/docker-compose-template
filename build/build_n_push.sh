#! /bin/bash

source ../.env

RELEASE_VERSION=${RELEASE_VERSION:-6.6.6}
echo "Release tag found: ${RELEASE_VERSION}"
REMOTE_SERVER=${REMOTE_SERVER:-default}
PROJECT_NAME=${PROJECT_NAME:-default}

for service in $(find * -maxdepth 1 -type d); do
    IMAGE_NAME=${REMOTE_SERVER}/${PROJECT_NAME}_${service}:${RELEASE_VERSION}
    echo "Building ${IMAGE_NAME} service"
    cd ${service}
    docker image build . -t ${IMAGE_NAME}
    docker image push ${IMAGE_NAME}
    cd ..
done