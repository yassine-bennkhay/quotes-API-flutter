class Quote {
  late String text;
  late String author;

  Quote({
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'],
      author: json['author'] ,
    );
  }
}
