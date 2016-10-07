#!/usr/bin/env bash

set -e

pushd $THEM/ember.js
npm install -g bower
npm install
bower install
npm test
popd
