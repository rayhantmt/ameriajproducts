// core/config/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://c5f2ac935c3e.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';

  // User Endpoints
  static const String forgetpassword = '/auth/forgot_password';
  static const String updateUserEndpoint = '$baseUrl/user/update';

  // Other modules...
}
