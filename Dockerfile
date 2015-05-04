FROM debian:wheezy

MAINTAINER Werner Beroux <werner@beroux.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aview \
    bb \
    binclock \
    boxes \
    cmatrix \
    cowsay \
    figlet \
    fortune \
    libaa-bin \
    libcurses-perl \
    linuxlogo \
    make \
    metapixel \
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
# Note: watch is just usefull for so many of those comands.

# Install asciiquarium
RUN cpan -i Term::Animation
RUN wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
RUN tar -zxvf asciiquarium.tar.gz asciiquarium_1.1/asciiquarium
RUN cp asciiquarium_1.1/asciiquarium /usr/local/bin
RUN chmod 0755 /usr/local/bin/asciiquarium
RUN rm -rf asciiquarium_1.1 asciiquarium.tar.gz

# TODO: Install more stuff from http://mewbies.com/acute_terminal_fun_02_view_ascii_art_ansi_art_and_movies_on_the_terminal.htm

RUN useradd --uid 666 -m --shell /usr/sbin/nologin john
USER john

# Include /usr/games in PATH
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# TODO: Make a menu or show a least a list with a short description.
CMD echo "Fun Commands: aafire asciiquarium aview bb binclock boxes cmatrix cowsay figlet fortune linuxlogo metapixel nyancat rig sl toilet"
