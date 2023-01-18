FROM ubuntu:18.04

LABEL author="bk" \
	  maintainer="bkelly@45drives.com" \
	  description="build sedutil-cli"

USER root:root

ENV TZ=America/Glace_Bay
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y

RUN apt install -y \
    build-essential autoconf pkg-config libc6-dev make g++-multilib m4 libtool \
    ncurses-dev unzip zip git python zlib1g-dev wget bsdmainutils automake curl \
    bc rsync cpio git nasm sudo

COPY build.sh /root/build.sh