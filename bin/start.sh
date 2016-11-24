#!/bin/bash -e

# This script is meant to be run inside Docker.
# You can run this as bin/start.sh from project root after a gradle build

if [ -d build/libs ]; then
    readonly INSTALL_DIR=build/libs
else
    readonly INSTALL_DIR=$(pwd)
fi

JAVA_MEM="-XX:+UseG1GC -d64 -Xmx1g"

JAVA_OPTS="${JAVA_MEM}"
COMPUTERNAME=dev
readonly LANG=sv_SE.UTF-8

if [ -n "$ENV" ]; then
    case $ENV in
        prod)
            JAVA_OPTS="${JAVA_OPTS}"
            PROFILE="--spring.profiles.active=prod"
            ;;
        stage)
            JAVA_OPTS="${JAVA_OPTS}"
            PROFILE="--spring.profiles.active=stage"
            ;;
        int)
            JAVA_OPTS="${JAVA_OPTS}"
            PROFILE="--spring.profiles.active=int"
            ;;
        *)
            echo "ENV must be prod, stage or int"
            exit 1
            ;;
    esac
fi

CMD="java $JAVA_OPTS -jar $INSTALL_DIR/web.jar $PROFILE"

ORG_PORT=${PORT}
export SERVER_PORT=${UPSTREAM_PORT}
echo "Starting the Publish API :$SERVER_PORT with command: $CMD"
${CMD}
