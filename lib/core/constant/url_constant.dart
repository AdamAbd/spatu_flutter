class UrlConstant {
  /// Base URL
  // static const String baseUrl = 'https://dev-magazine.lumoshive.com/';
  static const String baseUrl = 'https://demo.emagz.mobi/';
  // static const String baseUrl = 'https://674f-210-210-175-63.ngrok.io/';

  ///API URL
  static const String apiUrl = baseUrl + 'api/v1';

  /// Auth
  static const String login = '$apiUrl/login';
  static const String loginGoogle = '$apiUrl/login/google';
  static String register = '$apiUrl/register';
  static String forgotPassword = '$apiUrl/password/email';
  static String logout = '$apiUrl/logout';

  /// Home
  static String banners = '$apiUrl/banner';
  static String popularCategory = '$apiUrl/popular/category';
  static String popularMagazine = '$apiUrl/popular/magazine';

  /// Category
  static String category = '$apiUrl/category';

  /// Library
  static String library = '$apiUrl/library';

  /// Profile
  static String editProfile = '$apiUrl/update/profile';
  static String settingProfile = '$apiUrl/update/password';
  static String contactUs = '$apiUrl/contact';

  /// Magazine
  static String getMagazineDetail = '$apiUrl/magazine';
  static var getMagazineCategory = '$apiUrl/category';
  static var getMagazinePremium = '$apiUrl/show_doc';
  static var storeMagazineFavorite = '$apiUrl/favorite';
  static var postBookmark = '$apiUrl/library';

  /// Subscribe
  static String subsplan = '$apiUrl/subplan';
  static String subscribe = '$apiUrl/subscribe';

  /// Notification
  static String notification = '$apiUrl/notif';

  /// Filter
  static String newMagazine = '$apiUrl/search/new';
  static String recentMagazine = '$apiUrl/search/recent';
  static String brand = '$apiUrl/search/brand';
  static String country = '$apiUrl/search/magz-country';

  /// Search
  static String searchAll = '$apiUrl/search/all';

  /// Placeholder Image
  static String placeholderImage = 'img/image/logo.png';
}
