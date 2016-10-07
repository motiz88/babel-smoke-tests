#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Building Ember.js' tests.ember.js.build

pushd $THEM/ember.js
npm install -g bower
npm install
bower install
BROCCOLI_ENV=production npm run build
$END 'Done building Ember.js' tests.ember.js.build
$START 'Testing Ember.js' tests.ember.js.test
TEST_SUITE=each-package-tests DISABLE_JSCS=true DISABLE_JSHINT=true BROCCOLI_ENV=production npm test
popd

$END 'Done testing Ember.js' tests.ember.js.test
