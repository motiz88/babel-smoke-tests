#!/usr/bin/env bash

set -e

US=$(cd us; pwd)
JQ=$(pwd)/node_modules/.bin/jq
SEMVER=$(pwd)/node_modules/.bin/SEMVER

pushd $US
pushd babylon
npm install
npm version patch
npm publish
popd # babylon
pushd babel
make bootstrap
BABEL_ENV=production make build-dist
BABEL_REPO_VERSION=$(JQ -r .version lerna.json)
node_modules/.bin/lerna publish --only-explicit-updates --skip-git --yes --repo-version $(SEMVER -i $BABEL_REPO_VERSION)
popd # babel
popd # $US