mixin UrlConstant {
  /// Base URL
  static const String baseUrl = 'https://spatu-production.up.railway.app/';

  ///API URL
  static const String apiUrl = '${baseUrl}api/v1';

  /// Auth
  static const String login = '$apiUrl/auth/login';
  static const String register = '$apiUrl/auth/register';
  static const String verify = '$apiUrl/auth/verify';
  static const String resendCode = '$apiUrl/auth/resend_code';
  static const String resetPassword = '$apiUrl/auth/reset';
}
