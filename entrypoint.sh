#!/usr/bin/env sh
set -e # Abort script at first error

args="--regex --entropy=False --max_depth=50" # Default trufflehog options

if [ -n "${INPUT_SCANARGUMENTS}" ]; then
  args="${INPUT_SCANARGUMENTS}" # Overwrite if new options string is provided
fi

git config --global --add safe.directory /github/workspace/.git

trufflehog file:///github/workspace $args 
