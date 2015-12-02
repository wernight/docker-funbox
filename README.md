Docker Funbox
=============

[Docker](https://docs.docker.com/installation/) container with fun geeky terminal commands and ASCII art.

### Featuring

In alphabetic order:

  * [AA-lib](http://aa-project.sourceforge.net/aalib/)
  * [ASCIIQuarium](http://robobunny.com/projects/asciiquarium/html/)
  * [BB](http://aa-project.sourceforge.net/bb/)
  * [BinClock](http://www.ngolde.de/binclock.html)
  * [boxes](http://boxes.thomasjensen.com/)
  * [CMatrix](http://www.asty.org/cmatrix/)
  * [cowsay](https://en.wikipedia.org/wiki/Cowsay)
  * [falling-<3s.sh](http://blog.yjl.im/2011/02/time-to-have-falling-hearts-screensaver.html)
  * [FIGlet](https://en.wikipedia.org/wiki/FIGlet)
  * [fortune](https://en.wikipedia.org/wiki/Fortune_%28Unix%29)
  * [ImageMagick](http://www.imagemagick.org/)
  * [libcaca](http://caca.zoy.org/wiki/libcaca)
  * [Linux_Logo](http://www.deater.net/weave/vmwprod/linux_logo/)
  * [lolcat](https://github.com/busyloop/lolcat)
  * [nyancat](http://nyancat.dakko.us/)
  * [pipes](https://gist.github.com/livibetter/4689307)
  * [RIG - Random identity generator](http://rig.sourceforge.net/)
  * `sl` (not to be confused with `ls`)
  * [TOIlet](http://caca.zoy.org/wiki/toilet)
  * [VLC](https://www.videolan.org/vlc/)
  * [XaoS](https://en.wikipedia.org/wiki/XaoS)


#### Basic usage

    $ docker run --rm -it wernight/funbox
                             _       _     _      ____             _
    __      _____ _ __ _ __ (_) __ _| |__ | |_   / / _|_   _ _ __ | |__   _____  __
    \ \ /\ / / _ \ '__| '_ \| |/ _` | '_ \| __| / / |_| | | | '_ \| '_ \ / _ \ \/ /
     \ V  V /  __/ |  | | | | | (_| | | | | |_ / /|  _| |_| | | | | |_) | (_) >  <
      \_/\_/ \___|_|  |_| |_|_|\__, |_| |_|\__/_/ |_|  \__,_|_| |_|_.__/ \___/_/\_\
                               |___/

    Screensavers / inifite animations:
      1) `aafire` - Fire pit
      2) `asciiquarium` - Aquarium
      3) `cacademo` - caca-utils demo
      4) `cmatrix` - Matrix
      5) `falling-hearts` - Falling Hearts screensaver
      6) `nyancat` - Nyan cat
      7) `pipes` - Pipes screensaver
      8) `xaos` - real-time interactive fractal zoomer
    Demos / short animations:
      9) `bb` - ASCII art demo
     10) `sl` - Train passing by
     11) `youtube` - Alias to watch YouTube video using `youtube-dl`, `vlc` and `caca`
    Static ASCII art:
      * Text`formatting:
         12) `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)
         13) `figlet` - ASCII large text print
         14) `toilet` - ASCII large text print
      * Other:
         15) `aview` - Convert image to ASCII art
         16) `cacaview` - Convert image to ASCII art
         17) `boxes` - Put various frames around given block of ASCII art.
         18) `binclock` - Current time in binary.
         19) `linuxlogo` - Standard linux logos
         20) `lolcat` - Colorful `cat`
    Random text generator:
     21) `rig` - Kind of person ID
     22) `fortune` - Random fortune cookie message


#### Some Examples

    $ docker run --rm -it wernight/funbox nyancat

![Screen-shot showing a nyancat in ASCII art](https://raw.githubusercontent.com/wernight/docker-funbox/master/doc/nyancat.png)

    $ docker run --rm -it wernight/funbox asciiquarium

![Screen-shot showing a sharq in an aquarium in ASCII art](https://raw.githubusercontent.com/wernight/docker-funbox/master/doc/asciiquarium.png)

    $ docker run --rm -it wernight/funbox sh -c "figlet funbox | boxes | toilet --gay -f term"

![Screen-shot showing a the word funbox in large text using ASCII art](https://raw.githubusercontent.com/wernight/docker-funbox/master/doc/funbox.png)

    $ docker run --rm -it wernight/funbox watch -ct -n1 "date '+%D%n%T' | figlet -k | boxes -a c -s 59 -d cat"

![Screen-shot showing a the current date and time in a frame with a cat on top using ASCII art](https://raw.githubusercontent.com/wernight/docker-funbox/master/doc/time-cat.png)

    $ docker run --rm -it wernight/funbox cvlc --no-audio -V caca /examples/countdown.mp4

![Screen-shot showing number 3 in 3-D using ASCII art](https://raw.githubusercontent.com/wernight/docker-funbox/master/doc/countdown-video.png)

You can also watch YouTube videos from the console thanks to the `youtube` alias (using `youtube-dl`, `vlc` and `caca-utils`) then use [cvlc keyboard shortcuts](https://openclipart.org/download/171818/keyboard-mappings-cvlc.svg):

    $ docker run --rm -it wernight/funbox youtube 'https://www.youtube.com/watch?v=bMljuVqqmVU'


#### Security and mounting volumes

For security, all tools run as non-root user with uid `666`. So to access mounted volumes (images or media) do one of the following from within your Docker host:

  * Make them readable by everyone `chmod o+rx`
  * make them readable by uid/gid `666`
  * Run as another user: `docker run --rm -it --user $UID wernight/funbox ...`

Example:

    $ chown 666 my-image.png
    $ docker run --rm -it -v $PWD/my-image.png:/my-image.png:ro wernight/funbox metapixel /my-image.png


### See also

  * [20 amusing Linux commands to have fun with the terminal](http://www.binarytides.com/linux-fun-commands/)
  * [mewbies.com Fun On The Terminal - Index](http://mewbies.com/acute_terminal_fun_table_of_contents.htm)
