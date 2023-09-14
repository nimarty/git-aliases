#!/bin/sh
# alias to get a short log of the last n commits, 8 by default
git log --pretty='format:%C(auto)%h %<(18)%an %d %s' -n ${1-8}
