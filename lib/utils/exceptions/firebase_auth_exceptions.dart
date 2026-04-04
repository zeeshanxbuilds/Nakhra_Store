class ZFirebaseAuthException implements Exception {
  final String code;

  ZFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Email already registered. Please Log-in instead.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'We could not find an account with this email. Please check your spelling or register.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-credential':
        return 'The email or password you entered is incorrect.';
      case 'too-many-requests':
        return 'Too many failed login attempts. Your account has been temporarily locked. Please try again later.';
      case 'network-request-failed':
        return 'No internet connection. Please check your network and try again.';

      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials.';
      case 'credential-already-in-use':
        return 'This Google account is already linked to another user.';
      case 'operation-not-allowed':
        return 'This sign-in method is currently disabled. Please contact support.';
      default:
        return 'an unexpected authentication error occurred. Please try again.';
    }
  }
}
