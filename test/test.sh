#!/bin/bash

# Go to script root
pushd $(dirname "$0")

# Build deb files if needed
../build.sh

# Clean up last container if things were not successful
docker-compose down

# Rebuild image and run install
docker-compose build
docker-compose run ubuntu_meta bash -c /deb/install.sh

# Clean up after successful run
docker-compose down

# Go back to previous directory
popd