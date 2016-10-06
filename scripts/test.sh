#!/usr/bin/env bash

scripts/bootstrap.sh

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
popd 

./patch-deps.js

pushd $THEM/react
npm test
popd 