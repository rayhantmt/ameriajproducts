import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
import 'package:dio/dio.dart';


class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
     
      responseType: ResponseType.json,
    ),
  );

  Future<Response> postFormData({
    required String url,
    required FormData data,
    required String token,
  }) async {
    try {
      final response = await _dio.patch(url, data: data,options: Options(
        headers: {
          'Authorization': 'Bearer $token', // Set the bearer token
        },));
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException(e.response?.data['message'] ?? 'Bad Request');
          case 401:
            throw UnauthorizedException(e.response?.data['message'] ?? 'Unauthorized');
          case 404:
            throw NotFoundException(e.response?.data['message'] ?? 'Not Found');
          case 500:
            throw InternalServerException(e.response?.data['message'] ?? 'Server Error');
          default:
            throw AppException(e.response?.data['message'] ?? 'Unknown Error');
        }
      } else {
        throw FetchDataException('No Internet Connection');
      }
    }
  }
}
