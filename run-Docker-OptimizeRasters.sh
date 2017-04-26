#!/usr/bin/env bash

ORGANIZATION=nbuchanan
IMAGE=optimize-rasters
OUTPUT_DIR=output
APP_DIR=/app

if [[ ! -e $OUTPUT_DIR ]]; then
    mkdir $OUTPUT_DIR
fi

docker run --rm -it -v ${PWD}/${OUTPUT_DIR}:${APP_DIR}/output "${ORGANIZATION}/${IMAGE}" -config=OptimizeRasters-Docker.xml $*