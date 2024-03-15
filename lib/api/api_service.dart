import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl;
  final Dio dio;

  ApiService({required this.baseUrl})
      : dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 20 * 1000),
            receiveTimeout: const Duration(seconds: 20 * 1000),
            receiveDataWhenStatusError: true,
            headers: {
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*'
            }));

  Future<Map> get(String endpoint, String searchText) async {
    try {
      final response = await dio.get(endpoint, queryParameters: {
        'q': searchText,
      });
      return response.data;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post(String endpoint, dynamic data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Failed to post data');
    }
  }
}
