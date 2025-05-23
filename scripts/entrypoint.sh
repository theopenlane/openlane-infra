#!/bin/bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: ./entrypoint.sh [dev|prod]"
  exit 1
fi

bootstrap.sh "$1"