import 'package:dio/dio.dart';

class DioClient {
  static final dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ),
  );
}
