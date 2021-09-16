import 'package:bluestack_assignment/core/constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TournamentApiRepository {
  Dio? _dio;

  TournamentApiRepository() {
    final BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.tournament,
    );
    _dio = Dio(options)
      ..interceptors.addAll([LogInterceptor(responseBody: true)]);
  }

  Future<Response> fetchTournaments() async {
    Response response;
    try {
      response = await _dio!.get('/tournament/api/tournaments_list_v2',
          queryParameters: {"limit": 10, "status": "all"});

      return response;
      // debugPrint(response.data.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
