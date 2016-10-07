#!/usr/bin/env bash

set -e

node_modules/.bin/verdaccio -l localhost:4873 -c verdaccio.yml &

REGISTRY=http://localhost:4873/
npm config --global set registry $REGISTRY --loglevel silly

NPM_LOGIN=$(pwd)/scripts/npm-login.sh

$NPM_LOGIN

scripts/bootstrap.sh

npm cache clean

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
npm test
popd

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
