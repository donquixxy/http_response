import 'package:http_response/models/api_response.dart';

abstract class ApiProvidersImplements {
  Future<ApiResponse> get(String url, {Map<String, dynamic>? params});
}
