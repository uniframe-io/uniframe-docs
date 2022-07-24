#!/usr/bin/env bash

# Global defaults
: "${NAME_MATCHING_DOC_HOME:="/opt/name-matching-docs"}"

case "$1" in
  serve-doc-internal)
    exec mkdocs serve -a localhost:8082
    ;;
  serve-doc-public)
    exec mkdocs serve -a 0.0.0.0:8082
    ;;
  *)
    # Just run it in the right environment.
    exec "$@"
    ;;
esac
