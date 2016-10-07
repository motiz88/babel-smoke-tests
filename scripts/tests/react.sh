#!/usr/bin/env bash

set -e

pushd $THEM/react
npm install
npm test
popd
