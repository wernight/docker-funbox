Docker Funbox
=============

Docker container with fun terminal commands and ASCII art.

Featuring
---------

  * Inifite animations:
      * `aafire` - Fire pit
      * `asciiquarium` - Aquarium
      * `cmatrix` - Matrix
      * `nyancat` - Nyan cat
  * Demos / short animations:
      * `bb` - ASCII art demo
      * `sl` - Train passing by
  * Static ASCII art:
      * Text`formatting:
          * `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)
          * `figlet` - ASCII large text print
          * `toilet` - ASCII large text print
      * Other:
          * `aview` - Convert image to ASCII art
          * `boxes` - Put various frames around given block of ASCII art.
          * `binclock` - Current time in binary.
          * `metapixel` - Convert image to ASCII art
          * `linuxlogo` - Standard linux logos
  * Random text generator:
      * `fig` - Kind of person ID
      * `fortune` - Random fortune cookie message


### Examples


    $ docker run --rm -it wernight/funbox nyancat

    $ docker run --rm -it wernight/funbox asciiquarium

    $ docker run --rm -it wernight/funbox sh -c "figlet funbox | boxes | toilet --gay -f term"

    $ docker run --rm -it wernight/funbox watch -t -n1 "date '+%D%n%T' | figlet -k | boxes -a c -s 59 -d cat"


See also
--------

  * [20 amusing Linux commands to have fun with the terminal](http://www.binarytides.com/linux-fun-commands/)
  * [newbies.com Fun On The Terminal - Index](http://mewbies.com/acute_terminal_fun_table_of_contents.htm)
