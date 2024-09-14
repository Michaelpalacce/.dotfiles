#!/usr/bin/env bash

# Purpose of this script is to copy over the git hooks to the .git/hooks directory
# and copy over the identity files to the .ssh directory

cp -r ./git-hooks/* ./.git/hooks/

. ./git-hooks/post-merge
