#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Building React' tests.react.build

pushd $THEM/react
npm install
$END 'Done building React' tests.react.build
$START 'Testing React' tests.react.test
npm test
popd

$END 'Done testing React' tests.react.test
