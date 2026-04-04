class ZPlatformException implements Exception {
  final String code;

  ZPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return 'No internet connection. Please check your network and try again.';
      case 'sign_in_canceled':
        return 'Sign-in was cancelled. Please try again.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please check your account details.';
      default:
        return 'An unexpected platform error occurred. Please try again.';
    }
  }
}
