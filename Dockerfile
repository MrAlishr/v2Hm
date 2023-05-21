FROM alpine
ENV V2RAY_VMESS_AEAD_FORCED=false
RUN apk add --no-cache v2ray
RUN mkdir -p /etc/v2ray/
COPY config.json /etc/v2ray/
ENV PATH=/usr/bin/v2ray:/usr/sbin:/usr/bin:/sbin:/bin
CMD v2ray -config=/etc/v2ray/config.json
