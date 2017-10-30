FROM anapsix/alpine-java:8_server-jre

MAINTAINER ac0v <ac0v@sys-network.de>

WORKDIR /app

RUN apk --update add --virtual build-dependencies unzip wget \
    && wget https://github.com/ac0v/burstcoin/releases/download/1.3.6cg/burstcoin-1.3.6cg.zip \
    && unzip burstcoin-1.3.6cg.zip \
    && apk del build-dependencies

COPY entrypoint.sh /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
