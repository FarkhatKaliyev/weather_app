import 'package:dio/dio.dart';

class ApiRepository {
  static const String url = 'https://api.openweathermap.org/data/2.5/';
  static const String apiKey = '16bdb44b068c5c2cb80dba653cd41ef8';
  static Dio dio = initializeDio();
}

initializeDio() {
  var dio = Dio();
  dio.options.baseUrl = ApiRepository.url;
  dio.interceptors.add(AppInterceptor());
  return dio;
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) async {
    options.queryParameters
        .addAll({'appid': ApiRepository.apiKey, 'lang': 'en'});

    return handler.next(options);
  }
}
