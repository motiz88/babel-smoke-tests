#!/usr/bin/env bash

REGISTRY=http://localhost:4873/

npm adduser --loglevel silly --registry=$REGISTRY <<EOF
smoketest
smoketest
smoketest@babeljs.io
EOF

npm whoami --loglevel silly
