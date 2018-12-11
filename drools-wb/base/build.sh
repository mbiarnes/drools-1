#!/bin/bash

# *********************************************
# Drools Workbench - Docker image build script
# ********************************************


PROPERTY_FILE="../../image.properties"

function getProperty {
   IMAGE_PROP=$1
   KIE_PROP=`cat $PROPERTY_FILE | grep "$IMAGE_PROP" | cut -d'=' -f2`
   echo $KIE_PROP
}

KIE_VERSION=$(getProperty)

echo "KIE_VERSION =" $KIE_VERSION

IMAGE_NAME="jboss/drools-workbench"
IMAGE_TAG="7.15.0.Final"


# Build the container image.
echo "Building the Docker container for $IMAGE_NAME:$IMAGE_TAG.."
docker build --rm --build-arg KIE_VERSION=$KIE_VERSION -t $IMAGE_NAME:$IMAGE_TAG .
echo "Build done"
