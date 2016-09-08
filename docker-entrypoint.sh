#!/bin/bash

set -e

# Add bosun as command if needed
if [ "${1:0:1}" = '-' ]; then
  set -- bosun -disable-syslog "$@"
fi

# As argument is not related to bosun,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
