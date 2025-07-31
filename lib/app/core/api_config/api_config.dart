// core/config/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://api.example.com';

  // Auth Endpoints
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String registerEndpoint = '$baseUrl/auth/register';

  // User Endpoints
  static const String userProfileEndpoint = '$baseUrl/user/profile';
  static const String updateUserEndpoint = '$baseUrl/user/update';

  // Other modules...
}
