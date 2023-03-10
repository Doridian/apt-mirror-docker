# Building apt-mirror from sources

FROM debian:bullseye-slim

RUN apt update && apt install --no-install-recommends -y tar bzip2 gzip xz-utils gcc make perl wget rsync

WORKDIR /apt-mirror
COPY ./apt-mirror /apt-mirror
COPY ./.perltidyrc /apt-mirror
COPY ./Makefile /apt-mirror
COPY ./mirror.list /apt-mirror
COPY ./postmirror.sh /apt-mirror

RUN make
RUN make install
