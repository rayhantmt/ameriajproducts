// core/config/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://0fe35140eed4.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String signupEndpoint = '/auth/signup';

  // User Endpoints
  static const String userProfileEndpoint = '$baseUrl/user/profile';
  static const String updateUserEndpoint = '$baseUrl/user/update';

  // Other modules...
}
