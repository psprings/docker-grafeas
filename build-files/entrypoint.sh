#!/bin/sh

# RUN THE DEFAULT CONFD BACKEND
if [ -z "${CONFD_BACKEND}" ]; then
    export CONFD_BACKEND=env
fi

/usr/local/bin/confd -onetime -backend "${CONFD_BACKEND}"

exec /grafeas-server "$@"