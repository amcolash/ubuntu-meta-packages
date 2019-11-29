#!/bin/bash

# Build helper
function build_package {
  pushd $1
  equivs-build $1.cfg
  popd
}

# Remove old packages
rm **/*.deb

# Build new packages
build_package core
build_package dev
build_package media
build_package repositories
build_package util

# Move all debs to a single place
mkdir -p deb
mv **/*.deb deb