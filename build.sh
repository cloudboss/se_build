#!/bin/sh

app=${1}

usage()
{
    echo "Usage: ${0} <app>"
    exit ${1}
}

[ ${#} = 1 ] || usage 1

set -xe && \
  git clone /repo /home/elixir/see_eye && \
  docker build /home/elixir/see_eye/apps/${app}
