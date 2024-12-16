FROM debian

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
        perl \
        rig \
        sl \
        toilet \
        vlc \
        watch \
        xaos \
        lolcat \
        ffmpeg \

    && echo "Install youtube-dl" \
    && curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/bin/youtube-dl \
    && chmod 755 /usr/bin/youtube-dl \

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
    && curl -L https://raw.githubusercontent.com/pipeseroni/pipes.sh/refs/heads/master/pipes.sh -o /usr/local/bin/pipes \
    && chmod +x /usr/local/bin/pipes \

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
