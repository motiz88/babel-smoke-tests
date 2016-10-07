#!/usr/bin/env bash

set -e

START=$(cd scripts; pwd)/section-start.sh
END=$(cd scripts; pwd)/section-end.sh

$START 'Building and testing jQuery' tests.jquery.build

pushd $THEM/jquery
npm install
npm test
popd

$END 'Done testing jQuery' tests.jquery.test
