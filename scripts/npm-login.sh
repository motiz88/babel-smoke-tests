#!/usr/bin/env bash

REGISTRY=http://localhost:4873/

npm adduser --registry=$REGISTRY <<EOF
smoketest
smoketest
smoketest@babeljs.io
EOF
