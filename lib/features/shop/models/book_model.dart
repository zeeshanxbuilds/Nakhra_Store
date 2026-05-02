import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String id;
  final String title;
  final double price;
  final String categoryId;
  final String coverImageUrl;
  final String? pdfUrl;
  final int stock;
  final bool isFeatured;

  final String description;
  final String authorId;
  final String authorName;
  final String vendorId;
  final String vendorName;
  final String vendorLogo;
  final double rating;
  final int reviewCount;

  BookModel({
    required this.id,
    required this.title,
    required this.price,
    required this.categoryId,
    required this.coverImageUrl,
    this.pdfUrl,
    this.stock = 0,
    this.isFeatured = false,
    this.description = '',
    this.authorId = '',
    this.authorName = '',
    this.vendorId = '',
    this.vendorName = '',
    this.vendorLogo = '',
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  static BookModel empty() => BookModel(id: '', title: '', price: 0.0, categoryId: '', coverImageUrl: '');

  // 🚨 FIXED: Now includes ALL fields so data isn't lost when saving to Favorites!
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'categoryId': categoryId,
      'coverImageUrl': coverImageUrl,
      'pdfUrl': pdfUrl,
      'stock': stock,
      'isFeatured': isFeatured,
      'description': description,
      'authorId': authorId,
      'authorName': authorName,
      'vendorId': vendorId,
      'vendorName': vendorName,
      'vendorLogo': vendorLogo,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  // Used when reading from the main Books collection (Fedex Envelope)
  // Used when reading from the main Books collection (Fedex Envelope)
  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // 🚨 FIX: We inject the Firebase Document ID directly into the JSON map
      // BEFORE we send it to fromJson, so the 'final' rule is respected!
      data['id'] = document.id;

      return BookModel.fromJson(data);
    } else {
      return BookModel.empty();
    }
  }
  // 🚨 NEW FIX: Used when reading from the Favorites JSON array (Flat Paper)
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: double.tryParse((json['price'] ?? 0.0).toString()) ?? 0.0,
      categoryId: json['categoryId'] ?? '',
      coverImageUrl: json['coverImageUrl'] ?? '',
      pdfUrl: json['pdfUrl'],
      stock: json['stock'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
      description: json['description'] ?? '',
      authorId: json['authorId'] ?? '',
      authorName: json['authorName'] ?? '',
      vendorId: json['vendorId'] ?? '',
      vendorName: json['vendorName'] ?? '',
      vendorLogo: json['vendorLogo'] ?? '',
      rating: double.tryParse((json['rating'] ?? 0.0).toString()) ?? 0.0,
      reviewCount: json['reviewCount'] ?? 0,
    );
  }
}
