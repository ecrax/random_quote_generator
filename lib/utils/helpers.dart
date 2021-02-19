class Author {
  Author({this.name, this.note});

  final String name;
  final String note;
}

class Quote {
  Quote({this.text, this.author});

  final String text;
  final Author author;
}
