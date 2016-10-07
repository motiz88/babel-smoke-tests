#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Testing Ember.js...' tests.ember.js

pushd $THEM/ember.js
npm install -g bower
npm install
bower install
npm test
popd

$END 'Done testing Ember.js' tests.ember.js
