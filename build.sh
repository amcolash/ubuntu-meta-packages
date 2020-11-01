#!/bin/bash

# move into the base directory
pushd $(dirname "$0") > /dev/null

# Build helper
function build_package {
  echo $1
  echo -----------------------------------------------
  pushd $1 > /dev/null

  # Check if there is an existing build
  files=$(ls ../deb/amcolash*$1*.deb 2> /dev/null | wc -l)

  # only build a new version if there are git changes detected in the sub-folder or a build does not exist
  if [[ `git status --porcelain .` ]] || [[ "$files" == 0 ]]; then
    # build a new deb
    echo Changes detected in $1, rebuilding
    equivs-build $1.cfg

    # clean build artifacts
    rm *.buildinfo
    rm *.changes

    # remove old builds and move over the new one
    rm -f ../deb/amcolash*$1*.deb
    mv *.deb ../deb/
  else
    echo skipping $1 due to no changes
  fi
  echo
  popd > /dev/null
}

# Make desitnation if it doesn't exist
mkdir -p deb

# Build new packages
build_package core
build_package dev
build_package media
build_package repositories
build_package util
build_package ui

# back to where we were
popd > /dev/null
