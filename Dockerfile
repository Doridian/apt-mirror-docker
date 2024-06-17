FROM debian:bookworm-slim

RUN apt update && apt install --no-install-recommends -y tar bzip2 gzip xz-utils perl wget rsync

COPY rootfs/ /
RUN chmod 755 /usr/local/bin/apt-mirror /etc/apt/*.sh

ARG PUID=1001
ARG PGID=1001

USER ${PUID}:${PGID}
CMD ["/usr/local/bin/apt-mirror"]
