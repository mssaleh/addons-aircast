FROM ubuntu:focal

RUN apt update && apt install -y --no-install-recommends apt-utils libssl1.1 wget && \
    wget --no-check-certificate -O /usr/local/bin/aircast "https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64" && \
    chmod a+x /usr/local/bin/aircast &&\
    rm -rf /tmp/* /var/cache/apk/* /var/tmp/*

CMD ["/usr/local/bin/aircast", "-r", "-Z", "-I"]
