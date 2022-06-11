import 'dart:convert';

import 'package:http/http.dart';
import 'package:nashe_delo/services/api/rapid_api_service.dart';

class BadStatusCodeWhileCreatingTeam implements Exception {}

class BadStatusCodeWhileJoiningTeam implements Exception {}

class TeamsService {
  final RapidApiService _rapidApiService;
  final String _accessKey;

  TeamsService(this._rapidApiService, this._accessKey);

  factory TeamsService._hackathon(
    String accessKey,
  ) =>
      TeamsService(
        RapidApiService("https://i-pro-backend.herokuapp.com"),
        accessKey,
      );

  static TeamsService getInstance(String accessKey) {
    return TeamsService._hackathon(accessKey);
  }

  Future<void> addTeam({required String teamName}) async {
    Response response = await _rapidApiService.post(
      method: "team",
      body: {'name': teamName},
      headers: {'Authorization': 'Bearer $_accessKey'},
    );
    switch (response.statusCode) {
      case 200:
        break;

      // TODO: Throws group already exist

      default:
        throw BadStatusCodeWhileCreatingTeam();
    }
  }

  Future<List<dynamic>> getTeams() async {
    Response response = await _rapidApiService.get(
        method: "user/team", headers: {'Authorization': 'Bearer $_accessKey'});
    return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
  }

  Future<void> joinTeam({required String teamName}) async {
    Response response = await _rapidApiService.post(
      method: "user/team",
      body: {'name': teamName},
      headers: {'Authorization': 'Bearer $_accessKey'},
    );
    switch (response.statusCode) {
      case 200:
        break;

      // TODO: Throws group does not exist

      default:
        throw BadStatusCodeWhileJoiningTeam();
    }
  }
}
