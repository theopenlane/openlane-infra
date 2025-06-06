#!/bin/bash
# This script runs the chart-testing tool locally. It simulates the linting that is also done by the github action.
# Reference: https://github.com/helm/chart-testing

set -eux

SRCROOT="$(cd "$(dirname "$0")/.." && pwd)"
echo $SRCROOT

echo -e "\n-- Linting all Helm Charts --\n"
docker run \
     -v "$SRCROOT:/workdir" \
     --entrypoint /bin/sh \
     quay.io/helmpack/chart-testing:v3.12.0 \
     -c cd /workdir \
     ct lint \
     --config .github/configs/ct-lint.yaml \
     --lint-conf .github/configs/lintconf.yaml \
     --debug
