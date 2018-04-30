#!/bin/sh

set -xe # print commands and exit on error

case ${TEST} in
  BasicGs)
    $TRAVIS_BUILD_DIR/tests/testBasicGs.sh
    ;;
  *)
    echo "Unknown TEST configuration: ${TEST}. Please check your Travis file." >&2
    exit 1
    ;;
esac
