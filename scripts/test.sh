#!/usr/bin/env bash

set -e

node_modules/.bin/verdaccio -l localhost:4873 -c verdaccio.yml &

export NPM_CONFIG_REGISTRY=http://localhost:4873/

NPM_LOGIN=$(pwd)/scripts/npm-login.sh

$NPM_LOGIN

scripts/bootstrap.sh

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
npm test
popd

pushd $THEM/ember.js
npm install -g bower
npm install
bower install
npm test
popd

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
