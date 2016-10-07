#!/usr/bin/env bash

set -e

US=$(cd us; pwd)
START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Bootstrapping our modules...' bootstrap

$START 'Building Babylon...' bootstrap.build.babylon
pushd $US
pushd babylon
npm install
npm version patch --no-git-tag-version --ignore-scripts
npm publish
popd # babylon
$END 'Done Building Babylon' bootstrap.build.babylon

$START 'Building Babel...' bootstrap.build.babel
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
node_modules/.bin/lerna exec npm version patch --no-git-tag-version --ignore-scripts
node_modules/.bin/lerna exec npm publish --ignore-scripts
popd # babel
popd # $US
$END 'Done Building Babel' bootstrap.build.babel

$END 'Done bootstrapping our modules' bootstrap
