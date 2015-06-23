#!/bin/sh

figlet wernight/funbox

choice=""

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
echo ' 11) `youtube` - Alias to watch YouTube video using `youtube-dl`, `vlc` and `caca`'
echo 'Static ASCII art:'
echo '  * Text`formatting:'
echo '     12) `cowsay` - Talking cow (or actually many others, run with `-l` to get a list and via `-f <name>` to use one)'
echo '     13) `figlet` - ASCII large text print'
echo '     14) `toilet` - ASCII large text print'
echo '  * Other:'
echo '     15) `aview` - Convert image to ASCII art'
echo '     16) `cacaview` - Convert image to ASCII art'
echo '     17) `boxes` - Put various frames around given block of ASCII art.'
echo '     18) `binclock` - Current time in binary.'
echo '     19) `linuxlogo` - Standard linux logos'
echo '     20) `lolcat` - Colorful `cat`'
echo 'Random text generator:'
echo ' 21) `rig` - Kind of person ID'
echo ' 22) `fortune` - Random fortune cookie message'
echo

read -p 'Menu: ' choice

set -x
case $choice in
  '1') exec aafire;;
  '2') exec asciiquarium;;
  '3') exec cacademo;;
  '4') exec cmatrix;;
  '5') exec falling-hearts;;
  '6') exec nyancat;;
  '7') exec pipes;;
  '8') exec xaos -autopilot;;
  '9') exec bb;;
  '10') exec sl;;
  '11') exec youtube 'https://www.youtube.com/watch?v=_7vkRTylYoA';;
  '12') exec cowsay 'wernight/funbox';;
  '13') exec figlet 'wernight/funbox';;
  '14') exec toilet 'wernight/funbox';;
  '15') convert /examples/blob-beroux.png ~/blob-beroux.pgm && exec aview ~/blob-beroux.pgm;;
  '16') exec cacaview examples/blob-beroux.png;;
  '17') fortune | exec boxes -d parchment;;
  '18') exec binclock;;
  '19') exec linuxlogo -L random_xy;;
  '20') cat /examples/0?.txt | exec lolcat -a -d 1 -F 0.09;;
  '21') exec rig;;
  '22') exec fortune riddles;;
  *) echo "Invalid menu number!!! Leaving now.";;
esac
