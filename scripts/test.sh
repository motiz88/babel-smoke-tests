#!/usr/bin/env bash

set -e

scripts/bootstrap.sh

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
popd 

scripts/patch-deps.js

pushd $THEM/react
npm test
popd 