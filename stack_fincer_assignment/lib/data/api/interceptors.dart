import 'package:dio/dio.dart';
import 'package:stack_fincer_assignment/utils/Log.dart';
import 'api_service.dart';
import 'environment.dart';

InterceptorsWrapper requestInterceptor(Dio dio, Environment env) =>
    InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        final uri = options.uri.toString();

        //TODO: Add any headers needed here

        if (ApiService().isInDebugMode) {
          Log.v("Api - URL: ${uri.toString()}");
          Log.v("Api - headers: ${options.headers}");
          Log.v("Api - Request Body: ${options.data}");
        }

        return options;
      },
    );

InterceptorsWrapper responseInterceptor(Dio dio, Environment env) =>
    InterceptorsWrapper(onResponse: (Response response) {
      if (ApiService().isInDebugMode) {
        Log.v("Api - Response headers");
        response?.headers?.forEach((k, v) {
          v.forEach((s) => print("$k , $s"));
        });
        Log.v("Api - Response: ${response?.data}");
      }

      //TODO: Cache any headers here if needed

      return response;
    });
