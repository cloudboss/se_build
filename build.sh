#!/bin/sh -e

app=${1}
version=${2}

usage()
{
    echo "Usage: ${0} <app> <version>"
    exit ${1}
}

[ ${#} = 2 ] || usage 1

git clone /repo /home/elixir/see_eye
cd /home/elixir/see_eye
mix deps.get
mix release --profile ${app}:prod
docker build -t ${app}:${version} rel/${app}/releases/${version}
