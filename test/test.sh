#!/bin/bash

pushd $(dirname "$0")

docker-compose down
docker-compose build
../build.sh
docker-compose run ubuntu bash -c /deb/install.sh

popd