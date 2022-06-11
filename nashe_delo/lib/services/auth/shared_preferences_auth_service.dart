import 'package:intl/intl.dart';
import 'package:nashe_delo/services/api/rapid_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const accessKeyPreference = 'access_key';

// Encapsulates SharedPreferences to deal with credentials and etc.
class SharedPreferencesAuthService {
  final RapidApiService _rapidApiService;
  final SharedPreferences _sharedPreferences;

  SharedPreferencesAuthService(this._rapidApiService, this._sharedPreferences);
  factory SharedPreferencesAuthService._hackathon(
    SharedPreferences sharedPreferences,
  ) =>
      SharedPreferencesAuthService(
        RapidApiService("https://i-pro-backend.herokuapp.com"),
        sharedPreferences,
      );

  static Future<SharedPreferencesAuthService> getInstance() async {
    return SharedPreferencesAuthService._hackathon(
      await SharedPreferences.getInstance(),
    );
  }

  Future<void> register({
    required String username,
    required String password,
    required String name,
    required String surname,
    required String email,
    required String phone,
    // DateTime, но для удобства можно поменять на String
    // "2021-01-19 16:00:00"
    required DateTime dateOfBirth,
  }) async {
    final String accessKey = await _rapidApiService.register(
      username: username,
      password: password,
      name: name,
      surname: surname,
      email: email,
      phone: phone,
      dateOfBirth: DateFormat('yyyy-MM-dd hh:mm:ss').format(dateOfBirth),
    );
    await _sharedPreferences.setString(
      accessKeyPreference,
      accessKey,
    );
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final String accessKey = await _rapidApiService.login(
      username: username,
      password: password,
    );
    await _sharedPreferences.setString(
      accessKeyPreference,
      accessKey,
    );
  }

  void logout() {
    _sharedPreferences.remove(accessKeyPreference);
  }

  bool isUserLoggedIn() {
    final String accessKey = currentAccessKey ?? "";
    return accessKey.isNotEmpty;
  }

  String? get currentAccessKey =>
      _sharedPreferences.getString(accessKeyPreference);
}
