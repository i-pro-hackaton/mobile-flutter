import 'package:flutter/material.dart';
import 'package:nashe_delo/constants/routes.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';
import 'package:nashe_delo/services/users/user_service.dart';
import 'package:nashe_delo/utilities/drawer_builder.dart';
import 'package:nashe_delo/utilities/show_logout_dialog.dart';

enum ProfileMenuAction {
  logout,
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late final UserService _userService;
  late final SharedPreferencesAuthService _sharedPreferencesAuthService;
  bool _sharedPreferencesAuthServiceWasInitialized = false;

  Future<void> initSharedPreferencesAuthService() async {
    if (_sharedPreferencesAuthServiceWasInitialized) {
      return;
    }
    _sharedPreferencesAuthService = await Future.delayed(
      // Delay for demonstration purposes
      const Duration(seconds: 0),
      () async => await SharedPreferencesAuthService.getInstance(),
    );
    _sharedPreferencesAuthServiceWasInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSharedPreferencesAuthService(),
      builder: (context, snapshot) => Scaffold(
        drawer: snapshot.connectionState == ConnectionState.done
            ? getDrawer(context, snapshot, _sharedPreferencesAuthService)
            : null,
        appBar: AppBar(
          title: const Text("Профиль"),
          actions: [
            PopupMenuButton<ProfileMenuAction>(
              itemBuilder: (context) => [
                const PopupMenuItem<ProfileMenuAction>(
                  value: ProfileMenuAction.logout,
                  child: Text("Выйти"),
                ),
              ],
              onSelected: (value) async {
                switch (value) {
                  case ProfileMenuAction.logout:
                    final shouldLogout = await showLogOutDialog(context);
                    if (shouldLogout) {
                      // Logout
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          // Might happen but never in usual
                          break;
                        case ConnectionState.done:
                          _sharedPreferencesAuthService.logout();
                          if (!mounted) return;
                          await Navigator.of(context).pushNamedAndRemoveUntil(
                              mainRoute, (route) => false);
                          break;
                      }
                    }
                    break;
                }
              },
            )
          ],
        ),
        body: Center(child: Builder(
          builder: (context) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                String accessKey =
                    _sharedPreferencesAuthService.currentAccessKey ?? "";
                if (accessKey.isEmpty) {
                  // Should not happen at all btw
                }
                _userService = UserService.getInstance(accessKey);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Profile Info"),
                    FutureBuilder(
                      future: _userService.getUserData(),
                      builder: (context, snapshot) => Text(
                          "UserDict: ${snapshot.connectionState == ConnectionState.done ? snapshot.data.toString() : 'loading'}"),
                    )
                  ],
                );
            }
          },
        )),
      ),
    );
  }
}
