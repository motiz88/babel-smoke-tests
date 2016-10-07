#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Building Ember.js' tests.ember.js.build

pushd $THEM/ember.js
npm install -g bower
npm install
bower install
$END 'Done building Ember.js' tests.ember.js.build
$START 'Testing Ember.js' tests.ember.js.test
npm test
popd

$END 'Done testing Ember.js' tests.ember.js.test
