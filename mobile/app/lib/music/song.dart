class Song {
  String nameSong;
  Song(this.nameSong);
  setNameAutor(String nameSong) {
    this.nameSong = nameSong;
  }

  getNameSong() {
    return this.nameSong;
  }

  void addTrack() {}
}

Song song = Song('In the end ');
