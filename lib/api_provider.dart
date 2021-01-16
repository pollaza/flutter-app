import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio;
  String aToken = '';

  final BaseOptions options =
      new BaseOptions(baseUrl: 'https://pollazatechtalk.azurewebsites.net');
  static final ApiProvider _instance = ApiProvider._internal();

  factory ApiProvider() => _instance;

  ApiProvider._internal() {
    _dio = Dio(options);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options options) async {
      _dio.interceptors.requestLock.lock();
      options.headers["cookie"] = aToken;
      _dio.interceptors.requestLock.unlock();
      return options;
    }));
  }

  Future login(String username, String password) async {
    final request = {"username": username, "password": password};
    final response = await _dio.post('/Account/Login', data: request);
    final cookies = response.headers.map['set-cookie'];

    if (cookies.isNotEmpty) {
      final authToken = cookies[0].split(';')[0];

      aToken = authToken;
      print('token: $aToken');
    }
  }

  Future logout() async {
    final request = {};
    final response = await _dio.post('/Account/Logout', data: request);

    print(response.data.toString());
  }

  Future getBets() async {
    final response = await _dio.get('/Bet');

    print(response.data.toString());
  }
}
