mixin UrlConstant {
  /// Base URL
  static const String baseUrl = 'https://spatu-production.up.railway.app/';
  // static const String baseUrl = 'https://8e3c-103-213-128-130.ngrok.io/';

  ///API URL
  static const String apiUrl = '${baseUrl}api/v1';

  /// Auth
  static const String login = '$apiUrl/auth/login';
  static const String register = '$apiUrl/auth/register';
  static const String verify = '$apiUrl/auth/verify';
  static const String resendCode = '$apiUrl/auth/resend_code';
  static const String sendReset = '$apiUrl/auth/reset';
  static const String resetPassword = '$apiUrl/auth/reset_password';
  static const String google ='$apiUrl/auth/google';
}
