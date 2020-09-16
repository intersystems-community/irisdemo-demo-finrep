#!/bin/bash

source ../buildtools.sh

echo "Building iris-datasource image now..."

VERSION=`cat ../VERSION`
DOCKER_TAG="version-${VERSION}"

IMAGE_NAME=intersystemsdc/irisdemo-demo-finrep:iris-${DOCKER_TAG}
docker build -t $IMAGE_NAME ./
go_up_tree_and_exit_if_error "IRIS Image could not be built"

echo $IMAGE_NAME >> ../images_built
