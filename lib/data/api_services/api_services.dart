import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ameriajproducts/app/core/api_config/api_config.dart';
import 'package:ameriajproducts/app/core/exceptions/exceptions.dart';
class ApiService {
  static Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    try {
      final response = await http.post(
        uri,
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          return jsonDecode(response.body);
        case 400:
          throw BadRequestException(response.body);
        case 401:
        case 403:
          throw UnauthorizedException(response.body);
        case 404:
          throw NotFoundException(response.body);
        case 500:
        default:
          throw InternalServerException(response.body);
      }
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
