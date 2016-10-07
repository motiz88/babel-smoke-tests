#!/usr/bin/env bash

set -e

node_modules/.bin/verdaccio -l localhost:4873 -c verdaccio.yml &

npm set registry http://localhost:4873/

npm adduser <<EOF
smoketest
smoketest
smoketest@babeljs.io
EOF

scripts/bootstrap.sh

THEM=$(cd them; pwd)

pushd $THEM/react
npm install
npm test
popd

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
