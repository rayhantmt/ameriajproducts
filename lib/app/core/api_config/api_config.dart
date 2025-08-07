// core/config/api_config.dart

class ApiConfig {
  static const String baseUrl = 'https://0161e2f63e72.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';

  // User Endpoints
  static const String forgetpassword = '/auth/forgot_password';
  static const String otpendpoint = '/auth/verify_otp';
  static const String restpasswordendpoint='/auth/reset_password';
  static const String changepasswordendpoint='/auth/update_password';
  static const String getappointment='/Appointment?_id=68814ce1247ee934ae7d3ca6&details=This is short description two';
  static const String psotappointment='/Appointment';
  static const String getAppointmentEndpoint='/Appointment';
  static const String track='/track';

  // Other modules...
}
