# docker-shadowsocks


Build a tiny docker image (compressed ~ 16MB) for shadowsocks based on [alpine](https://alpinelinux.org/)
linux distribution.


## Usage

Pull the latest version from [docker hub](https://hub.docker.com/r/ggicci/shadowsocks/):

```
docker pull ggicci/shadowsocks
```

And run it with command:

```
docker run -d -p 8388:8388 ggicci/shadowsocks -s 0.0.0.0 -p 8388 -m aes-256-cfb -k ${your_password}
```
