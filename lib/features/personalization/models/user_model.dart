import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  String fullName;
  final String email;
  String phoneNumber;
  String profilePicture;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
    required this.createdAt,
  });

  Map<String, dynamic> tojson() {
    return {
      'FullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'UID': uid,
      'CreatedAt': createdAt,
    };
  }

  static UserModel empty() =>
      UserModel(uid: '', fullName: '', email: '', phoneNumber: '', profilePicture: '', createdAt: DateTime.now());

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        uid: document.id,
        fullName: data['FullName'],
        email: data['Email'],
        phoneNumber: data['PhoneNumber'],
        profilePicture: data['ProfilePicture'],
        createdAt: (data['CreatedAt'] as Timestamp).toDate(),
      );
    } else {
      return UserModel.empty();
    }
  }
}
