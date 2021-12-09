#!/usr/bin/env bash

# Purpose: find string in file recusivily

fd -H '^\.DS_Store$' -tf -X rm

# -H: hidden file
# -tf: file type -> file
# -X: batch exec
