import 'package:dio/dio.dart';
import 'package:stack_fincer_assignment/utils/Log.dart';

class ApiResponse<T> {
  int code;
  T body;
  DioError error;
  bool success = false;

  ApiResponse.success(Response<T> response) {
    code = response?.statusCode ?? 0;
    body = response?.data ?? "";
    success = true;
  }

  ApiResponse.failure(DioError e) {
    error = e;
    code = e.response.statusCode;
    if (e is DioError) {
      body = e.response.data;
      Log.v("Error = ${e.response.data}");
      Log.v("Error Code = ${e.response.statusCode}");
    }
  }
}
