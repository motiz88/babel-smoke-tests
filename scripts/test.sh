#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Setting up local npm registry' setup.npm.registry
node_modules/.bin/verdaccio -l localhost:4873 -c verdaccio.yml &

export NPM_CONFIG_REGISTRY=http://localhost:4873/

NPM_LOGIN=$(pwd)/scripts/npm-login.sh

$NPM_LOGIN

$END 'Done setting up local npm registry' setup.npm.registry

scripts/bootstrap.sh

export THEM=$(cd them; pwd)

if [[ $SPECIFIC_TEST ]]; then
    scripts/tests/$SPECIFIC_TEST.sh
else
    scripts/tests/ember.js.sh
    scripts/tests/react.sh
fi

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
