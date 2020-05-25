FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dubai

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends libssl1.1 wget && \
    mkdir -p /tmp && \
    wget --no-check-certificate -P /tmp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64 && \
    mkdir -p /aircast && \
    cp /tmp/aircast-x86-64 /aircast/aircast && \
    chmod +x /aircast/aircast

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get autoremove --purge -y && apt-get autoclean && apt-get clean && \
    rm -fr \
        /etc/shairport-sync.conf \
        /tmp/* \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

COPY rootfs /

ENTRYPOINT [ "bash", "/start.sh" ]

