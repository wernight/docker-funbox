#!/bin/sh

figlet wernight/funbox

choice=""

while [ "$choice" != "q" ]
do
  echo
  echo 'Screensavers / inifite animations:'
  echo '  1) `aafire` - Fire pit'
  echo '  2) `asciiquarium` - Aquarium'
  echo '  3) `cacademo` - caca-utils demo'
  echo '  4) `cmatrix` - Matrix'
  echo '  5) `falling-hearts` - Falling Hearts screensaver'
  echo '  6) `nyancat` - Nyan cat'
  echo '  7) `pipes` - Pipes screensaver'
  echo '  8) `xaos` - real-time interactive fractal zoomer'
  echo 'Demos / short animations:'
  echo '  9) `bb` - ASCII art demo'
  echo ' 10) `sl` - Train passing by'
  echo 'Static ASCII art:'
  echo '  * Text`formatting:'
  echo '     11) `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)'
  echo '     12) `figlet` - ASCII large text print'
  echo '     13) `toilet` - ASCII large text print'
  echo '  * Other:'
  echo '     14) `aview` - Convert image to ASCII art'
  echo '     15) `cacaview` - Convert image to ASCII art'
  echo '     16) `boxes` - Put various frames around given block of ASCII art.'
  echo '     17) `binclock` - Current time in binary.'
  echo '     18) `linuxlogo` - Standard linux logos'
  echo '     19) `lolcat` - Colorful `cat`'
  echo 'Random text generator:'
  echo ' 20) `fig` - Kind of person ID'
  echo ' 21) `fortune` - Random fortune cookie message'
  echo "q) Quit"
  echo

  read -p 'Menu: ' choice

  case $choice in
    '1') exec aafire;;
    '2') exec asciiquarium;;
    '3') exec cacademo;;
    '4') exec cmatrix;;
    '5') exec falling-hearts;;
    '6') exec nyancat;;
    '7') exec pipes;;
    '8') exec xaos;;
    '9') exec bb;;
    '10') exec sl;;
    '11') exec crowsay 'wernight/funbox';;
    '12') exec figlet 'wernight/funbox';;
    '13') exec toilet 'wernight/funbox';;
    '14') convert /media/blob-beroux.png ~/blob-beroux.pgm && exec aview ~/blob-beroux.pgm;;
    '15') exec cacaview media/blob-beroux.png;;
    '16') exec boxes 'wernight/funbox';;
    '17') exec binclock;;
    '18') exec linuxlogo;;
    '19') curl -Ls http://mewbies.com/asciiart/{01..04}.txt | lolcat -a -d 1 -F 0.09;;
    '20') exec fig;;
    '21') exec fortune;;
    'q') echo "quiting!";;
    *) echo "menu item is not available; try again!";;
  esac
done
