import 'dart:convert';

import 'package:dio/dio.dart';

import 'globals.dart';

class ApiProvider {
  Dio _dio;

  final BaseOptions options = new BaseOptions(baseUrl: Globals.baseURL);
  static final ApiProvider _instance = ApiProvider._internal();

  factory ApiProvider() => _instance;

  ApiProvider._internal() {
    _dio = Dio(options);
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options options) async {
      _dio.interceptors.requestLock.lock();
      options.headers["Authorization"] = Globals.authToken;
      print("+Authorization: " + Globals.authToken);
      _dio.interceptors.requestLock.unlock();
      return options;
    }));
  }

  Future login(String username, String password) async {
    final request = {"username": username, "password": password};
    final response = await _dio.post('/Account/Login', data: request);
    Map responseMap = jsonDecode(response.toString());
    if (responseMap["isSuccess"]) {
      print("Login: success");
      Globals.authToken = responseMap["token"];
      print('Authorization: ' + Globals.authToken);
    } else {
      print("Login: failed");
    }
    return responseMap;
  }

  Future logout() async {
    return await _dio.post('/Account/Logout');
  }

  Future getBets() async {
    final response = await _dio.get('/Bet');
    var data = jsonDecode(response.toString());
    return data;
  }

  Future putBets(var ids, var teamScores1, var teamScores2) async {
    final request = {
      "matchId": ids,
      "scoresTeam1": teamScores1,
      "scoresTeam2": teamScores2
    };

    final response = await _dio.post('/Bet', data: request);
    Map responseMap = jsonDecode(response.toString());
    return responseMap["isSuccess"];
  }

  Future<Map> getScores() async {
    final response = await _dio.get('/Phase/Results');
    return jsonDecode(response.toString());
  }

  Future<Map> getRanking() async {
    final response = await _dio.get('/Phase/ScoreBoard');
    return jsonDecode(response.toString());
  }
}
