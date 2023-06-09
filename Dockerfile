FROM alpine
ENV V2RAY_VMESS_AEAD_FORCED=false
RUN apk add --no-cache v2ray
RUN mkdir -p /etc/v2ray/
COPY config.json /etc/v2ray/
CMD /usr/bin/v2ray run --config /etc/v2ray/config.json
