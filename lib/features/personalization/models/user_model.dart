class UserModel {
  final String uid;
  String fullName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  Map<String, dynamic> tojson() {
    return {
      'FullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'UID': uid,
    };
  }
}
