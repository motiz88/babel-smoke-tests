#!/usr/bin/env bash

set -e

US=$(cd us; pwd)
START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Bootstrapping our modules' bootstrap

$START 'Building Babylon' bootstrap.build.babylon
pushd $US
pushd babylon
npm install
$END 'Done building Babylon' bootstrap.build.babylon
$START 'Publishing Babylon test version' bootstrap.publish.babylon
npm version patch --no-git-tag-version --ignore-scripts > /dev/null
npm publish --force
$END 'Done publishing Babylon test version' bootstrap.publish.babylon
popd # babylon

$START 'Building Babel' bootstrap.build.babel
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
$END 'Done building Babel' bootstrap.build.babel
$START 'Publishing Babel test versions' bootstrap.publish.babel
node_modules/.bin/lerna exec -- npm version patch --no-git-tag-version --ignore-scripts > /dev/null
node_modules/.bin/lerna exec --concurrency 1 -- npm publish --force --ignore-scripts
$END 'Done publishing Babel test versions' bootstrap.publish.babel
popd # babel
popd # $US

$END 'Done bootstrapping our modules' bootstrap
