#!/usr/bin/env bash

opts="$*"

cat <<EOF
---
$(date)
---

EOF

find orig -name '*.html' | while read orig; do
  relpath=$(echo $orig | sed 's@orig/@@')
  echo >&2 "Comparing $relpath"
  diff --ignore-all-space --ignore-blank-lines ${opts} $orig <(cat _site/$relpath | sed -E '/^ +$/d')
done
