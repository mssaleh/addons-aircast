FROM alpine:latest

RUN apk update && apk add --no-cache libssl1.1 wget && \
    mkdir -p /aircast && \
    wget --no-check-certificate -P /aircast https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64 && \

COPY rootfs ./

RUN mv /aircast/aircast-x86-64 ./aircast/aircast
    chmod a+x ./aircast/aircast && \
    chmod a+x ./aircast/start.sh && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT [ "./aircast/start.sh" ]
