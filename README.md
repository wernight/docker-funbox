Docker Funbox
=============

[Docker](https://docs.docker.com/installation/) container with fun geeky terminal commands and ASCII art.

Featuring
---------

  * Screensavers / inifite animations:
      * `aafire` - Fire pit
      * `asciiquarium` - Aquarium
      * `cmatrix` - Matrix
      * `nyancat` - Nyan cat
  * Demos / short animations:
      * `bb` - ASCII art demo
      * `cacademo` - caca-utils demo.
      * `sl` - Train passing by
  * Static ASCII art:
      * Text`formatting:
          * `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)
          * `figlet` - ASCII large text print
          * `toilet` - ASCII large text print
      * Other:
          * `aview` - Convert image to ASCII art
          * `cacaview` - Convert image to ASCII art
          * `boxes` - Put various frames around given block of ASCII art.
          * `binclock` - Current time in binary.
          * `linuxlogo` - Standard linux logos
  * Random text generator:
      * `fig` - Kind of person ID
      * `fortune` - Random fortune cookie message


### Basic usage

    $ docker run --rm -it wernight/funbox

For security, all tools run as non-root user with uid `666`. So if you mount images or media, first make sure that their are accessible by everyone or add uid/gid `666` to them:

    $ chown 666 my-image.png
    $ docker run --rm -it -v $PWD/my-image.png:/my-image.png:ro wernight/funbox metapixel /my-image.png


### Some Examples

![Screen-shot showing a nyancat in ASCII art](https://github.com/wernight/docker-funbox/raw/master/src/media/nyancat.png)

    $ docker run --rm -it wernight/funbox nyancat

![Screen-shot showing a sharq in an aquarium in ASCII art](https://github.com/wernight/docker-funbox/raw/master/src/media/asciiquarium.png)

    $ docker run --rm -it wernight/funbox asciiquarium

![Screen-shot showing a the word funbox in large text using ASCII art](https://github.com/wernight/docker-funbox/raw/master/src/media/funbox.png)

    $ docker run --rm -it wernight/funbox sh -c "figlet funbox | boxes | toilet --gay -f term"

![Screen-shot showing a the current date and time in a frame with a cat on top using ASCII art](https://github.com/wernight/docker-funbox/raw/master/src/media/time-cat.png)

    $ docker run --rm -it wernight/funbox watch -t -n1 "date '+%D%n%T' | figlet -k | boxes -a c -s 59 -d cat"


See also
--------

  * [20 amusing Linux commands to have fun with the terminal](http://www.binarytides.com/linux-fun-commands/)
  * [newbies.com Fun On The Terminal - Index](http://mewbies.com/acute_terminal_fun_table_of_contents.htm)
