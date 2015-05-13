FROM debian:jessie

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
    curl \
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
    vlc \
    watch \
    xaos

# Install lolcat and youtube-dl
RUN echo "deb http://http.us.debian.org/debian sid main non-free contrib" >> /etc/apt/sources.list
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y lolcat youtube-dl

# Notes:
# - libaa-bin is aafire
# - perl, libcurses-perl and make are used to run asciiquarium for example.
# - curl, watch, imagemagick, vlc and youtube-dl are just useful for so many of those commands.

# Install asciiquarium
RUN cpan -i Term::Animation
RUN curl -L http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz -o asciiquarium.tar.gz
RUN tar -zxvf asciiquarium.tar.gz asciiquarium_1.1/asciiquarium
RUN cp asciiquarium_1.1/asciiquarium /usr/local/bin
RUN chmod 0755 /usr/local/bin/asciiquarium
RUN rm -rf asciiquarium_1.1 asciiquarium.tar.gz

# Install Falling Hearts
RUN curl -L https://yjl.googlecode.com/hg/Bash/falling-%3C3s.sh -o /usr/local/bin/falling-hearts
RUN chmod +x /usr/local/bin/falling-hearts

# Install pipes
RUN curl -L https://gist.githubusercontent.com/livibetter/4689307/raw/949e43fe2962c2c97c8b1d974ff93dd053d9bd37/pipes.sh -o /usr/local/bin/pipes
RUN chmod +x /usr/local/bin/pipes

# Clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd --uid 666 -m --shell /usr/sbin/nologin john
USER john

# Include /usr/games in PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# We support 256color, right? If not, you can always change this environment variable.
ENV TERM=xterm-256color

# youtube helper script
ADD youtube /usr/local/bin/youtube

ADD examples /examples
ADD menu.sh /
CMD /menu.sh
