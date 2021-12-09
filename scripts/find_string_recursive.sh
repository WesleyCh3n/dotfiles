#!/usr/bin/env bash

# Purpose: find string in file recusivily

fd -tf -x grep -rn $target_string

# fd:
  # -tf: file type -> file
  # -x: exec
# grep:
  # -r: recusivily
  # -n: show matching string line number
