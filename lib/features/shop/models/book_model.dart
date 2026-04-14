import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final double price;
  final String categoryId;
  final String coverImageUrl;

  final String? pdfUrl;
  final int stock;
  final bool isFeatured;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.categoryId,
    required this.coverImageUrl,
    this.pdfUrl,
    this.stock = 0,
    this.isFeatured = false,
  });

  static BookModel empty() =>
      BookModel(id: '', title: '', author: '', price: 0.0, categoryId: '', coverImageUrl: '');

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'price': price,
      'categoryId': categoryId,
      'coverImageUrl': coverImageUrl,
      'pdfUrl': pdfUrl,
      'stock': stock,
      'isFeatured': isFeatured,
    };
  }

  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BookModel(
        id: document.id,
        title: data['title'] ?? '',
        author: data['author'] ?? '',
        price: double.parse((data['price'] ?? 0.0).toString()),
        categoryId: data['categoryId'] ?? '',
        coverImageUrl: data['coverImageUrl'] ?? '',
        pdfUrl: data['pdfUrl'],
        stock: data['stock'] ?? 0,
        isFeatured: data['isFeatured'] ?? false,
      );
    } else {
      return BookModel.empty();
    }
  }
}
