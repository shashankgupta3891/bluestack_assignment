import 'package:bluestack_assignment/core/constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthApiRepository {
  Dio? _dio;

  AuthApiRepository() {
    final BaseOptions options = BaseOptions(baseUrl: ApiConstants.auth);
    _dio = Dio(options)
      ..interceptors.addAll([LogInterceptor(responseBody: true)]);
  }

  Future<Response> login() async {
    Response response;
    try {
      response = await _dio!.get('/v1/login');

      return response;
      // debugPrint(response.data.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
