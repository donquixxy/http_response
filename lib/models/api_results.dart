class ApiResults<T> {
  final T data;

  ApiResults({
    required this.data,
  });

  factory ApiResults.fromJson(Map<String, dynamic> json, String fieldName,
          Function(Map<String, dynamic>) createMap) =>
      ApiResults<T>(
        data: json[fieldName] != null && json[fieldName] is Map
            ? createMap(json[fieldName])
            : createMap({}),
      );
}

class ApiResultsList<T> {
  final int? statusCode;
  final String? message;
  final List<T>? data;

  ApiResultsList({required this.message, required this.statusCode, this.data});

  factory ApiResultsList.fromJson(Map<String, dynamic> json, String fieldName,
          Function(List<dynamic>) createList) =>
      ApiResultsList<T>(
          message: 'Succes',
          statusCode: 200,
          data: json[fieldName] != null && json[fieldName] is List
              ? createList(json[fieldName])
              : null);

  factory ApiResultsList.failure(int statusCode, String message) =>
      ApiResultsList<T>(
        data: null,
        message: 'Failed to Fetch',
        statusCode: 500,
      );
}
