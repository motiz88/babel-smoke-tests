#!/usr/bin/env bash

if [[ $TRAVIS = true ]];
  echo $1 && echo -en 'travis_fold:end:$2\\r'
fi