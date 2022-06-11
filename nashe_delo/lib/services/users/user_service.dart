import 'dart:convert' show jsonDecode, utf8;
import 'package:http/http.dart';
import 'package:nashe_delo/services/api/rapid_api_service.dart';

// class AuthenticatedService {
//   final RapidApiService _rapidApiService;
//   final String _accessKey;

//   UserService(this._rapidApiService, this._accessKey);

//   factory UserService._hackathon(
//     String accessKey,
//   ) =>
//       UserService(
//         RapidApiService("https://i-pro-backend.herokuapp.com"),
//         accessKey,
//       );

//   static UserService getInstance(String accessKey) {
//     return UserService._hackathon(accessKey);
//   }
// }

// Users api
class UserService {
  final RapidApiService _rapidApiService;
  final String _accessKey;

  UserService(this._rapidApiService, this._accessKey);

  factory UserService._hackathon(
    String accessKey,
  ) =>
      UserService(
        RapidApiService("https://i-pro-backend.herokuapp.com"),
        accessKey,
      );

  static UserService getInstance(String accessKey) {
    return UserService._hackathon(accessKey);
  }

  Future<void> updateUser({required Map<String, String?> data}) async {
    await _rapidApiService.put(
      method: "user/update",
      body: data,
      headers: {'Authorization': 'Bearer $_accessKey'},
    );
  }

  Future<Map<String, dynamic>> getUserData() async {
    Response response = await _rapidApiService.get(
      method: "user/profile",
      headers: {'Authorization': 'Bearer $_accessKey'},
    );
    Map<String, dynamic> data =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return data;
  }
}
