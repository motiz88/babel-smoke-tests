#!/usr/bin/env bash

US=$(cd us; pwd)
JQ=$(pwd)/node_modules/.bin/jq

pushd $US
pushd babylon
npm install
npm publish
popd # babylon
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
node_modules/.bin/lerna publish --only-explicit-updates --skip-git --yes --repo-version $(JQ -r .version lerna.json)
popd # babel
popd # $US