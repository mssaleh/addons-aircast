FROM alpine:latest

RUN apk update && apk add --no-cache libssl1.1 wget && \
    mkdir -p /tmp && \
    wget --no-check-certificate -P /tmp https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64 && \
    mkdir -p /aircast && \
    cp /tmp/aircast-x86-64 /aircast/aircast && \
    chmod +x /aircast/aircast && \
    rm -rf /tmp/* /var/cache/apk/*

COPY rootfs /

ENTRYPOINT [ "/start.sh" ]