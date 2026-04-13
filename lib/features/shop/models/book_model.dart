class BookModel {
  final String id;
  final String title;
  final String author;
  final double price;
  final String category;
  final String coverImageUrl;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.category,
    required this.coverImageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'price': price,
      'category': category,
      'imageUrl': coverImageUrl,
    };
  }
}
