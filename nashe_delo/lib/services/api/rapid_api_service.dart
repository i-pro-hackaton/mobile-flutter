import 'package:http/http.dart';
import 'dart:convert' show jsonDecode, utf8;

import 'package:nashe_delo/services/api/basic_api_service.dart';
import 'package:nashe_delo/services/api/rapid_api_service_exceptions.dart';

// Wrapper class for Api
class RapidApiService extends BasicApiService {
  RapidApiService(super.apiUrlString);

  Future<String> register({
    required String username,
    required String password,
    required String name,
    required String surname,
    required String email,
    required String phone,
    // DateTime, но для удобства можно поменять на String
    // "2021-01-19 16:00:00"
    required String dateOfBirth,
  }) async {
    final Response response = await super.post(
      method: "registration",
      body: {
        "username": username,
        "password": password,
        "name": name,
        "surname": surname,
        "email": email,
        "phone": phone,
        "date_of_birth": dateOfBirth,
      },
      headers: {},
    );
    switch (response.statusCode) {
      case 200:
        break;

      // Other cases
      case 400:
        throw WeakPassword();
      case 422:
        throw BadRequest();

      case 500:
        throw InternalServerError();
      default:
        throw UnknownResponseCode(response.statusCode);
    }
    return jsonDecode(utf8.decode(response.bodyBytes))["access_token"];
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final Response response = await super.post(
      method: "login",
      body: {
        "username": username,
        "password": password,
      },
      headers: {},
    );
    switch (response.statusCode) {
      case 200:
        break;

      // Other cases
      case 400:
        throw WeakPassword();
      case 403:
        throw WrongPassword();
      case 404:
        throw UserDoesNotExist();

      case 500:
        throw InternalServerError();
      default:
        throw UnknownResponseCode(response.statusCode);
    }
    return jsonDecode(utf8.decode(response.bodyBytes))["access_token"];
  }
}
