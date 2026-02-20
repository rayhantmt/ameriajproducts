class ApiConfig {
  static const String baseUrl =
      'https://readiness-track-server.onrender.com/api/v1';
      //'https://e8ce-103-159-73-161.ngrok-free.app/api/v1';

  // Auth Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String signupEndpoint = '/auth/signup';
  // User Endpoints
  static const String forgetpassword = '/auth/forgot_password';
  static const String otpendpoint = '/auth/verify_otp';
  static const String restpasswordendpoint = '/auth/reset_password';
  static const String changepasswordendpoint = '/auth/update_password';
  static const String psotappointment = '/Appointment';
  static const String getAppointmentEndpoint = '/Appointment';
  static const String track = '/track';
  static const String trackhistory = '/track?trackType=';
  static const String weaponqualification = '/weapon-qualification';
  static const String getRangeQualificationEndpoint = '/range-qualification';
  static const String counseling = '/counseling';
  static const String physical_fitness = '/physical-fitness';
  static const String admin = '/adminUser';
  static const String medpro = '/medpro';
  static const String user='/user';
  static const String status='/track/status';
  // Other modules...
}
