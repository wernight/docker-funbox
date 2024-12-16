#!/usr/bin/env bash

# Setup buildx environment
docker buildx create --name build_cross --driver-opt env.BUILDKIT_STEP_LOG_MAX_SIZE=10000000 --driver-opt env.BUILDKIT_STEP_LOG_MAX_SPEED=10000000 || true
docker buildx use build_cross

# Build and push
docker buildx build --platform linux/386,linux/amd64,linux/arm64/v8,linux/arm/v6,linux/arm/v7,linux/ppc64le,linux/s390x -t wernight/funbox:latest . --push

# Update local image
docker pull wernight/funbox:latest
