FROM alpine:latest
MAINTAINER ggicci <ggicci@163.com>

RUN apk add --no-cache --update ca-certificates wget python py-setuptools && update-ca-certificates

WORKDIR /src
RUN wget "https://github.com/shadowsocks/shadowsocks/archive/2.9.0.tar.gz" -O shadowsocks.tar.gz \
  && tar zxf shadowsocks.tar.gz \
  && mv shadowsocks-2.9.0 /shadowsocks \
  && rm shadowsocks.tar.gz

WORKDIR /shadowsocks
RUN python setup.py install

ENTRYPOINT ["/usr/bin/ssserver"]
