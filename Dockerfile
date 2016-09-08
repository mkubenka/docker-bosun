# https://github.com/mkuzmin/docker-image-bosun

FROM debian:jessie
MAINTAINER Michal Kubenka <mkubenka@gmail.com>

RUN VERSION=0.5.0 \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qq update \
    && apt-get -y install wget ca-certificates \
    && wget https://github.com/bosun-monitor/bosun/releases/download/$VERSION/bosun-linux-amd64 -O /usr/local/bin/bosun -nv \
    && chmod +rx /usr/local/bin/bosun \
    && apt-get -y purge --auto-remove wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data

VOLUME /data

COPY docker-entrypoint.sh /

EXPOSE 8070
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["-h"]
