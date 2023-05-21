FROM alpine
ENV V2RAY_VMESS_AEAD_FORCED=false
RUN apk add v2ray
ADD cmd.sh /
RUN chmod +x /cmd.sh
CMD /cmd.sh