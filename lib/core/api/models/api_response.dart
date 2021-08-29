class ApiResponse<T> {
  int? code;
  String? message;
  T? result;

  ApiResponse({
    this.code,
    this.message,
    this.result,
  });

}