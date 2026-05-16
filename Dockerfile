FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get -y install \
	acl \
	autoconf \
	automake \
	bc \
	binwalk \
    build-essential \
    bzip2 \
	bzr \
	cmake \
	cmake-curses-gui \
	cpio \
	curl \
	device-tree-compiler \
	dialog \
	dosfstools \
	fdisk \
	gawk \
	gdisk \
	genimage \
	git \
	golang \
	imagemagick \
	libconfuse-dev \
	libncurses5-dev \
	locales \
	make \
	mtools \
	parted \
	p7zip-full \
	pkg-config \
	rsync \
	scons \
	sharutils \
	squashfs-tools \
	tree \
	u-boot-tools \
	udev \
	unzip \
	uuid \
	uuid-runtime \
	vim \
	wget \
	whiptail \
	zip \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/workspace
WORKDIR /root

RUN git clone https://github.com/anestisb/android-unpackbootimg && cd android-unpackbootimg && \
	make && mv -t /usr/bin unpackbootimg mkbootimg && cd ../ && \
	rm -rf android-unpackbootimg && \
	git clone https://github.com/Evsio0n/rsce-go && cd rsce-go && \
	go mod download && go mod tidy && go build -o rsce_tool && \
	cp rsce_tool /usr/local/bin/ && cd ../ && \
	rm -rf rsce-go

VOLUME /root/workspace
WORKDIR /root/workspace

CMD ["/bin/bash"]