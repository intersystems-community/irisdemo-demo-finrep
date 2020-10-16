#!/bin/bash

source ../buildtools.sh

echo "Building hyperledger-pex-adapter jar file..."
cd ./hyperledger-pex-adapter
./build.sh
go_up_tree_and_exit_if_error "hyperledger-pex-adapter could not be built"
cd ..

echo "hyperledger-pex-adapter jar file built!"

echo "Building iris-datasource image now..."

VERSION=`cat ../VERSION`
DOCKER_TAG="version-${VERSION}"

IMAGE_NAME=intersystemsdc/irisdemo-demo-finrep:iris-${DOCKER_TAG}
docker build -t $IMAGE_NAME ./
go_up_tree_and_exit_if_error "IRIS Image could not be built"

echo $IMAGE_NAME >> ../images_built
