#!/usr/bin/env bash

opts="$*"

find orig -name '*.html' | while read orig; do
  relpath=$(echo $orig | sed 's@orig/@@')
  echo >&2 "Comparing $relpath"
  diff --ignore-all-space --ignore-blank-lines ${opts} orig/$relpath _site/$relpath
done
