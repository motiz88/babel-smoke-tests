#!/usr/bin/env bash

if [[ $TRAVIS = true ]]; then
  echo -en "travis_fold:end:$2\r"
fi