import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nakhra/features/shop/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final double totalAmount;
  final String paymentMethod;
  final String status;
  final DateTime orderDate;
  final List<CartItemModel> items;
  // TODO later: Add delivery address field!

  OrderModel({
    required this.id,
    required this.userId,
    required this.totalAmount,
    this.paymentMethod = 'Cash on Delivery',
    this.status = 'Pending',
    required this.orderDate,
    required this.items,
  });

  // Convert to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'totalAmount': totalAmount,
      'paymentMethod': paymentMethod,
      'status': status,
      'orderDate': orderDate,
      // We convert our list of CartItems into a list of JSON Maps!
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  // Read from Firebase
  factory OrderModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;

    return OrderModel(
      id: document.id,
      userId: data['userId'] ?? '',
      totalAmount: double.tryParse(data['totalAmount'].toString()) ?? 0.0,
      paymentMethod: data['paymentMethod'] ?? 'Cash on Delivery',
      status: data['status'] ?? 'Pending',
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      // We convert the JSON array back into CartItemModels!
      items: (data['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
