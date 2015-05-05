FROM debian:wheezy

MAINTAINER Werner Beroux <werner@beroux.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aview \
    bb \
    binclock \
    boxes \
    caca-utils \
    cmatrix \
    cowsay \
    figlet \
    fortune \
    imagemagick \
    libaa-bin \
    libcurses-perl \
    linuxlogo \
    make \
    nyancat \
    perl \
    rig \
    sl \
    toilet \
    watch\
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Note: libaa-bin is aafire
# Note: perl, libcurses-perl, wget, and make are used to run asciiquarium.
# Note: watch and imagemagick are just usefull for so many of those comands.

# Install asciiquarium
RUN cpan -i Term::Animation
RUN wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
RUN tar -zxvf asciiquarium.tar.gz asciiquarium_1.1/asciiquarium
RUN cp asciiquarium_1.1/asciiquarium /usr/local/bin
RUN chmod 0755 /usr/local/bin/asciiquarium
RUN rm -rf asciiquarium_1.1 asciiquarium.tar.gz

RUN useradd --uid 666 -m --shell /usr/sbin/nologin john
USER john

# Include /usr/games in PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

ADD media/blob-beroux.png /media/blob-beroux.png
ADD menu.sh /
CMD /menu.sh
