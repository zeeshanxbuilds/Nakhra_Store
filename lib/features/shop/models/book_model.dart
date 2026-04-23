// import 'package:cloud_firestore/cloud_firestore.dart';

// class BookModel {
//   final String id;
//   final String title;
//   final String author;
//   final double price;
//   final String categoryId;
//   final String coverImageUrl;
//   final String? description;
//   final String? vendorName;
//   final double? rating;

//   final String? pdfUrl;
//   final int stock;
//   final bool isFeatured;

//   BookModel({
//     required this.id,
//     required this.title,
//     required this.author,
//     required this.price,
//     required this.categoryId,
//     required this.coverImageUrl,
//     this.description,
//     this.vendorName,
//     this.rating,
//     this.pdfUrl,
//     this.stock = 0,
//     this.isFeatured = false,
//   });

//   static BookModel empty() =>
//       BookModel(id: '', title: '', author: '', price: 0.0, categoryId: '', coverImageUrl: '');

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'author': author,
//       'price': price,
//       'categoryId': categoryId,
//       'coverImageUrl': coverImageUrl,
//       'pdfUrl': pdfUrl,
//       'stock': stock,
//       'isFeatured': isFeatured,
//     };
//   }

//   factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;

//       return BookModel(
//         id: document.id,
//         title: data['title'] ?? '',
//         author: data['author'] ?? '',
//         price: double.parse((data['price'] ?? 0.0).toString()),
//         categoryId: data['categoryId'] ?? '',
//         coverImageUrl: data['coverImageUrl'] ?? '',
//         pdfUrl: data['pdfUrl'],

//         stock: data['stock'] ?? 0,
//         isFeatured: data['isFeatured'] ?? false,
//       );
//     } else {
//       return BookModel.empty();
//     }
//   }
// }

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

  // 🚨 NEW FIELDS ADDED FROM FIRESTORE SCHEMA
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

    // Require the new fields (with defaults for safety)
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': authorId,
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
        price: double.parse((data['price'] ?? 0.0).toString()),
        categoryId: data['categoryId'] ?? '',
        coverImageUrl: data['coverImageUrl'] ?? '',
        pdfUrl: data['pdfUrl'],
        stock: data['stock'] ?? 0,
        isFeatured: data['isFeatured'] ?? false,

        // 🚨 MAP THE NEW FIELDS FROM FIRESTORE JSON TO DART VARIABLES
        description: data['description'] ?? '',
        authorId: data['authorId'] ?? '',
        authorName: data['authorName'] ?? '',
        vendorId: data['vendorId'] ?? '',
        vendorName: data['vendorName'] ?? '',
        vendorLogo: data['vendorLogo'] ?? '',
        rating: double.parse((data['rating'] ?? 0.0).toString()),
        reviewCount: data['reviewCount'] ?? 0,
      );
    } else {
      return BookModel.empty();
    }
  }

  // (You can also update toJson() if you want, but fromSnapshot is the most important for reading!)
}
