FROM openjdk:8u111
MAINTAINER i-webcore@svt.se

ADD web/build/libs /app

RUN chown -R daemon:daemon /app && \
  chmod 400 /app/* && \
  mkdir -p /app/logs && \
  chown daemon /app/logs && \
  chmod 500 /app/start.sh

WORKDIR /app
USER daemon

CMD /app/start.sh
