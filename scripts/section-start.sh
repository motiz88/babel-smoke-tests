#!/usr/bin/env bash

if [[ $TRAVIS = true ]]; then
  echo -en "travis_fold:start:$2\r" && echo $1
else
  echo $1
fi