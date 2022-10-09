mixin UrlConstant {
  /// Base URL
  static const String baseUrl = 'https://spatu-production.up.railway.app/';

  ///API URL
  static const String apiUrl = '${baseUrl}api/v1';

  /// Auth
  static const String login = '$apiUrl/auth/login';
}
