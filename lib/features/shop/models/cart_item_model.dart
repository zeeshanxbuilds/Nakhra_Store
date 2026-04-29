class CartItemModel {
  String bookId;
  String title;
  double price;
  String coverImageUrl;
  String vendorName;
  int quantity;
  bool isSelected;

  // The Constructor (Building the Lego Castle)
  CartItemModel({
    required this.bookId,
    required this.title,
    required this.price,
    required this.coverImageUrl,
    required this.vendorName,
    required this.quantity,
    required this.isSelected,
  });

  // Disassembling the Castle for Firebase (Dart Object -> Map)
  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'title': title,
      'price': price,
      'coverImageUrl': coverImageUrl,
      'vendorName': vendorName,
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }

  // Rebuilding the Castle from Firebase (Map -> Dart Object)
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      bookId: json['bookId'] ?? '',
      title: json['title'] ?? '',
      price: double.parse((json['price'] ?? 0.0).toString()),
      coverImageUrl: json['coverImageUrl'] ?? '',
      vendorName: json['vendorName'] ?? '',
      quantity: json['quantity'] ?? 0,
      isSelected: json['isSelected'] ?? true,
    );
  }
}
