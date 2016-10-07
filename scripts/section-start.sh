#!/usr/bin/env bash

if [[ $TRAVIS = true ]]; then
  echo $1 && echo -en "travis_fold:start:$2\r"
fi