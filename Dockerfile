FROM alpine:latest

COPY rootfs /

RUN apk update && apk add --no-cache libssl1.1 wget && \
    mkdir -p /tmp && \
    wget --no-check-certificate -P /tmp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64 && \
    mkdir -p /aircast && \
    cp /tmp/aircast-x86-64 /aircast/aircast && \
    chmod a+x /aircast/aircast && \
    chmod a+x /aircast/start.sh && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT [ "/aircast/start.sh" ]