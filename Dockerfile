FROM alpine:latest

# docker-compose -f /etc/v2ray/docker-compose.yml up -d
# https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
# https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip

RUN mkdir /tmp/v2ray && \
    wget -O /tmp/v2ray/v2ray-linux-64.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray/v2ray-linux-64.zip -d /tmp/v2ray


RUN install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray && \
    install -m 755 /tmp/v2ray/v2ctl /usr/bin/v2ctl && \
    mkdir /etc/v2ray && \
    cp /tmp/v2ray/config.json /etc/v2ray/config.json && \
    rm -rf /tmp/*

CMD ["/usr/bin/v2ray", "-config=/etc/v2ray/config.json"]