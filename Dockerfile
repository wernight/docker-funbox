FROM debian:buster

MAINTAINER Werner Beroux <werner@beroux.com>

# Notes:
# - libaa-bin is aafire
# - perl, libcurses-perl and make are used to run asciiquarium for example.
# - curl, watch, imagemagick, vlc and youtube-dl are just useful for so many of those commands.

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
        libncurses6 \
        perl \
        rig \
        sl \
        toilet \
        vlc \
        watch \
        xaos \

    && echo "Install lolcat and youtube-dl" \
    && echo "deb http://http.us.debian.org/debian sid main non-free contrib" >> /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        lolcat \
        youtube-dl \

    && echo "Install asciiquarium" \
    && cpan -i Term::Animation \
    && curl -L http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz -o asciiquarium.tar.gz \
    && tar -zxvf asciiquarium.tar.gz asciiquarium_1.1/asciiquarium \
    && cp asciiquarium_1.1/asciiquarium /usr/local/bin \
    && chmod 0755 /usr/local/bin/asciiquarium \
    && rm -rf asciiquarium_1.1 asciiquarium.tar.gz \

    && echo "Install Falling Hearts" \
    && curl -L https://yjl.googlecode.com/hg/Bash/falling-%3C3s.sh -o /usr/local/bin/falling-hearts \
    && chmod +x /usr/local/bin/falling-hearts \

    && echo "Install pipes" \
    && curl -L https://github.com/pipeseroni/pipes.sh/archive/v1.3.0.tar.gz -o pipes-v1.3.0.tar.gz \
    && tar -zxvf pipes-v1.3.0.tar.gz \
    && cd pipes.sh-1.3.0 && make install \
    && ln -s /usr/local/bin/pipes.sh /usr/local/bin/pipes \

    && echo "Clean-up" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    && useradd --uid 666 -m --shell /usr/sbin/nologin john

USER john

# Include /usr/games in PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# We support 256color, right? If not, you can always change this environment variable.
ENV TERM=xterm-256color

# youtube helper script
ADD youtube /usr/local/bin/youtube

ADD examples /examples
ADD menu.sh /

CMD ["/menu.sh"]
