FROM debian:bullseye-slim

RUN apt update && apt install --no-install-recommends -y tar bzip2 gzip xz-utils perl wget rsync

COPY rootfs/ /
RUN chmod 755 /bin/apt-mirror /etc/apt/*.sh

ARG PUID=1001
ARG PGID=1001

USER ${PUID}:${PGID}
CMD ["/bin/apt-mirror"]
