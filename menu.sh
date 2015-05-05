#!/bin/sh

figlet wernight/funbox

choice=""

while [ "$choice" != "q" ]
do
  echo
  echo 'Screensavers / inifite animations:'
  echo '  1) `aafire` - Fire pit'
  echo '  2) `asciiquarium` - Aquarium'
  echo '  3) `cmatrix` - Matrix'
  echo '  4) `nyancat` - Nyan cat'
  echo 'Demos / short animations:'
  echo '  5) `bb` - ASCII art demo'
  echo '  6) `cacademo` - caca-utils demo'
  echo '  7) `sl` - Train passing by'
  echo 'Static ASCII art:'
  echo '  * Text`formatting:'
  echo '      8) `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)'
  echo '      9) `figlet` - ASCII large text print'
  echo '     10) `toilet` - ASCII large text print'
  echo '  * Other:'
  echo '     11) `aview` - Convert image to ASCII art'
  echo '     12) `cacaview` - Convert image to ASCII art'
  echo '     13) `boxes` - Put various frames around given block of ASCII art.'
  echo '     14) `binclock` - Current time in binary.'
  echo '     15) `linuxlogo` - Standard linux logos'
  echo 'Random text generator:'
  echo ' 16) `fig` - Kind of person ID'
  echo ' 17) `fortune` - Random fortune cookie message'
  echo "q) Quit"
  echo

  read -p 'Menu: ' choice

  case $choice in
    '1') exec aafire;;
    '2') exec asciiquarium;;
    '3') exec cmatrix;;
    '4') exec nyancat;;
    '5') exec bb;;
    '6') exec cacademo;;
    '7') exec sl;;
    '8') exec crowsay 'wernight/funbox';;
    '9') exec figlet 'wernight/funbox';;
    '10') exec toilet 'wernight/funbox';;
    '11') convert /media/blob-beroux.png ~/blob-beroux.pgm && exec aview ~/blob-beroux.pgm;;
    '12') exec cacaview media/blob-beroux.png;;
    '13') exec boxes 'wernight/funbox';;
    '14') exec binclock;;
    '15') exec linuxlogo;;
    '16') exec fig;;
    '17') exec fortune;;
    'q') echo "quiting!";;
    *) echo "menu item is not available; try again!";;
  esac
done
