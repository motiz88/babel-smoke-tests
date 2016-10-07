#!/usr/bin/env bash

US=$(cd us; pwd)

pushd $US
pushd babylon
npm install
npm publish
popd # babylon
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
./node_modules/.bin/lerna publish --only-explicit-updates --skip-git --yes
popd # babel
popd # $US