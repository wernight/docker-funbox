youtube() {
    cvlc -I dummy -V caca $(youtube-dl -g $*)
}
