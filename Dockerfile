# msaraiva/elixir-dev:1.3.1
FROM msaraiva/elixir-dev@sha256:a9bb3d692463297d6cf34137068756197ec6e7a1b5112604e0258e0cec443488

ENV LANG=C.UTF-8

RUN set -xe && \
    apk add --no-cache \
      binutils=2.26-r0 \
      binutils-libs=2.26-r0 \
      docker=1.11.1-r0 \
      erlang-mnesia=18.3.2-r0 \
      g++=5.3.0-r0 \
      gcc=5.3.0-r0 \
      gmp=6.1.0-r0 \
      iptables=1.6.0-r0 \
      isl=0.14.1-r0 \
      libatomic=5.3.0-r0 \
      libc-dev=0.7-r0 \
      libgcc=5.3.0-r0 \
      libgomp=5.3.0-r0 \
      libmnl=1.0.3-r1 \
      libnftnl-libs=1.0.5-r0 \
      libseccomp=2.3.1-r0 \
      libstdc++=5.3.0-r0 \
      make=4.1-r1 \
      mpc1=1.0.3-r0 \
      mpfr3=3.1.2-r0 \
      musl=1.1.14-r11 \
      musl-dev=1.1.14-r11 \
      musl-utils=1.1.14-r11 \
      pkgconf=0.9.12-r0 \
      pkgconfig=0.25-r1 \
      xz=5.2.2-r1 \
      xz-libs=5.2.2-r1 && \
    addgroup -g 1000 elixir && \
    adduser -u 1000 -G elixir -h /home/elixir -D elixir

USER elixir

WORKDIR /home/elixir

RUN set -xe && \
    mix local.hex --force && \
    mix local.rebar --force

COPY build.sh /home/elixir/build.sh

ENTRYPOINT ["/home/elixir/build.sh"]
