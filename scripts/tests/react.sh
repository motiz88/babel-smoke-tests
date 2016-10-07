#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Testing React...' tests.react

pushd $THEM/react
npm install
npm test
popd

$END 'Done testing React' tests.react
