#!/usr/bin/env bash

US=$(cd us; pwd)

pushd $US
pushd babylon
npm link
npm run build
popd # babylon
pushd babel
make bootstrap
npm link babylon
cd packages/babel-core/
npm link babylon
cd ../../packages/babel-template/
npm link babylon
cd ../../packages/babel-traverse/
npm link babylon
cd ../../packages/babel-generator/
npm link babylon
make build
popd # babel
popd # $US