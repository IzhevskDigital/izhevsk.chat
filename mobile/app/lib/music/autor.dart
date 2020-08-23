class Autor {
  String autor;
  Autor(this.autor);
  setNameAutor(String name) {
    this.autor = name;
  }

  getNameAutor() {
    return this.autor;
  }
}

Autor autor = Autor('Linkin Park ');
