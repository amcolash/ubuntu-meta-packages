#!/bin/bash

pushd $(dirname "$0") > /dev/null

# Build helper
function build_package {
  echo $1
  echo -----------------------------------------------
  pushd $1 > /dev/null
  if [[ `git status --porcelain .` ]]; then
    echo Changes detected in $1, rebuilding
    equivs-build $1.cfg

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

popd > /dev/null
