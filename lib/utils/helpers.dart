class Author {
  Author({this.name, this.note});

  final String name;
  final String note;
}

class Quote {
  Quote({this.text, this.author});

  final String text;
  final Author author;

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json["data"][0]["quoteText"],
      author: Author(
        name: json["data"][0]["quoteAuthor"],
        note: json["data"][0]["quoteGenre"],
      ),
    );
  }
}
