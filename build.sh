#!/bin/bash
VERSION=`cat ./VERSION`
DOCKER_TAG="version-${VERSION}"

# funtion build_java_project will add a line with the full image name of each image built
# But we need to start with an empty file:
rm -f ./images_built

source ./buildtools.sh

###############################################################
# IRIS Data Source Image
###############################################################
cd ./image-iris
./build.sh
exit_if_error
cd ..
