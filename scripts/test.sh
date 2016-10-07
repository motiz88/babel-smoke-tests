#!/usr/bin/env bash

set -e

node_modules/.bin/verdaccio &

npm set registry http://localhost:4873/

scripts/bootstrap.sh

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
npm test
popd 