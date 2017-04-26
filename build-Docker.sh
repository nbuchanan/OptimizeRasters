#!/usr/bin/env bash

ORGANIZATION=nickbuchanan
IMAGE=optimize-rasters
TAG=0.1

if [ -n "$1" ]; then TAG="$1"; fi
echo "Using $TAG for the build tag"

docker build --rm -t "${ORGANIZATION}/${IMAGE}:${TAG}" .
docker tag "${ORGANIZATION}/${IMAGE}:${TAG}" "${ORGANIZATION}/${IMAGE}:latest"
