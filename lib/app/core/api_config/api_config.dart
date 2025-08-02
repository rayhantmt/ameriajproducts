// core/config/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://f5f65cc9463c.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';

  // User Endpoints
  static const String forgetpassword = '/auth/forgot_password';
  static const String otpendpoint = '/auth/verify_otp';
  static const String restpasswordendpoint='/auth/reset_password';

  // Other modules...
}
