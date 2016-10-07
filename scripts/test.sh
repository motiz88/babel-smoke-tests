#!/usr/bin/env bash

set -e

node_modules/.bin/verdaccio -l localhost:4873 -c verdaccio.yml &

REGISTRY=http://localhost:4873/
npm set registry $REGISTRY

npm adduser --registry=$REGISTRY <<EOF
smoketest
smoketest
smoketest@babeljs.io
EOF

scripts/bootstrap.sh

npm cache clean

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
npm test
popd

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
