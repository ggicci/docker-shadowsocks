FROM alpine:latest

RUN apk add --no-cache ca-certificates python py-setuptools
RUN apk add --no-cache --virtual .build-deps \
    wget \
  \
  && wget "https://github.com/shadowsocks/shadowsocks/archive/2.9.1.tar.gz" -O shadowsocks.tar.gz \
  && tar -C /usr/local -xzf shadowsocks.tar.gz \
  && rm shadowsocks.tar.gz \
  && cd /usr/local/shadowsocks-2.9.1 \
  && python setup.py install \
  && apk del .build-deps

LABEL me.ggicci.shadowsocks.image.version="2.9.1"
LABEL me.ggicci.shadowsocks.image.authors="<Ggicci ggicci.t@gmail.com>"
LABEL me.ggicci.shadowsocks.image.url="https://hub.docker.com/r/ggicci/shadowsocks"
LABEL me.ggicci.shadowsocks.image.source="https://github.com/ggicci/docker-shadowsocks.git"
LABEL me.ggicci.shadowsocks.image.licence="MIT"
LABEL me.ggicci.shadowsocks.image.title="Tiny Shadowsocks Image"
LABEL me.ggicci.shadowsocks.image.description="A tiny docker image of shadowsocks based on alpine."

ENTRYPOINT ["ssserver"]

