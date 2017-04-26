#!/usr/bin/env bash

ORGANIZATION=nbuchanan
IMAGE=optimize-rasters
APP_DIR=/app
DATA_DIR=data
OUTPUT_DIR=output

# Create supporting directories if needed
if [[ ! -e $DATA_DIR ]]; then
    mkdir $DATA_DIR
fi

if [[ ! -e $OUTPUT_DIR ]]; then
    mkdir $OUTPUT_DIR
fi

docker run --rm -it \
    -v ${PWD}/${DATA_DIR}:${APP_DIR}/${DATA_DIR} \
    -v ${PWD}/${OUTPUT_DIR}:${APP_DIR}/${OUTPUT_DIR} \
    "${ORGANIZATION}/${IMAGE}" \
    -config=OptimizeRasters-Docker.xml \
    $*