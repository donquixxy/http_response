class ApiResponse {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? data;

  ApiResponse({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        statusCode: 200,
        data: json['data'],
        message: 'Succes to Retrieve Data',
      );

  factory ApiResponse.failure(int statusCode, String message) => ApiResponse(
        statusCode: statusCode,
        data: null,
        message: message,
      );
}
