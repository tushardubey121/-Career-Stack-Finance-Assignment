import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stack_fincer_assignment/data/api/api_response.dart';
import 'package:stack_fincer_assignment/data/api/api_service.dart';
import 'package:stack_fincer_assignment/data/models/request/quiz_request.dart';
import 'package:stack_fincer_assignment/utils/utility.dart';

class AuthProvider {
  AuthProvider({@required this.api});

  ApiService api;

  Map<String, dynamic> get defaultParams => {
        "key": api.env.apiKey, // all
      };

  Future<ApiResponse> getQuiz({QuizRequest request}) async {
    Utility.hideKeyboard();
    try {
      final response = await api.dio.get(
        "",
        queryParameters: request.toJson(),
        options: Options(
          method: 'POST',
          contentType: "application/json",
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ApiResponse.success(response);
      }
    } catch (e) {
      return ApiResponse.failure(e);
    }
  }
}
