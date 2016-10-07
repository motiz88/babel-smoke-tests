#!/usr/bin/env bash

set -e

US=$(cd us; pwd)

pushd $US
pushd babylon
npm install
npm version patch --no-git-tag-version --ignore-scripts
npm publish
popd # babylon
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
node_modules/.bin/lerna exec npm version patch --no-git-tag-version --ignore-scripts
node_modules/.bin/lerna exec npm publish --ignore-scripts
popd # babel
popd # $US