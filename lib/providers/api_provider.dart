import 'package:dio/dio.dart';
import 'package:http_response/models/api_response.dart';
import 'package:http_response/providers/api_providers_interface.dart';

class ApiProviders implements ApiProvidersImplements {
  final Dio dio = Dio();

  @override
  Future<ApiResponse> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode != 200) {
        throw Exception('Failed to Fetch, status Code ${response.statusCode}');
      }

      ApiResponse apiResponse = ApiResponse(
        message: 'Succes to Retrieve',
        statusCode: response.statusCode ?? 200,
        data: response.data,
      );

      return apiResponse;
    } on DioError catch (error) {
      return ApiResponse.failure(error.response?.statusCode ?? 500,
          'Failed to fetch, dio error with ${error.message}');
    } catch (error) {
      ApiResponse.failure(404, 'Failed to Fetch');
    }
    return ApiResponse.failure(500, 'Something happened, failed to fetch');
  }
}
