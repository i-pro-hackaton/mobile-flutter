import 'package:flutter/material.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';
import 'package:nashe_delo/services/teams/teams_service.dart';
import 'package:nashe_delo/utilities/drawer_builder.dart';

class TeamsView extends StatefulWidget {
  const TeamsView({Key? key}) : super(key: key);

  @override
  State<TeamsView> createState() => _TeamsViewState();
}

class _TeamsViewState extends State<TeamsView> {
  late final TeamsService _teamsService;
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
          title: const Text("Команды"),

          // actions: [
          //   PopupMenuButton<TeamsMenuAction>(
          //     itemBuilder: (context) => [
          //       const PopupMenuItem<TeamsMenuAction>(
          //         value: TeamsMenuAction.logout,
          //         child: Text("Выйти"),
          //       ),
          //     ],
          //     onSelected: (value) async {
          //       switch (value) {
          //         case TeamsMenuAction.logout:
          //           if (snapshot.connectionState == ConnectionState.done) {
          //             _sharedPreferencesAuthService.logout();
          //             Navigator.of(context)
          //                 .pushNamedAndRemoveUntil(mainRoute, (route) => false);
          //           }
          //           break;
          //       }
          //     },
          //   )
          // ],
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
                _teamsService = TeamsService.getInstance(accessKey);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Teams Info"),
                    FutureBuilder(
                      future: _teamsService.getTeams(),
                      builder: (context, snapshot) => Text(
                          "TeamsDict: ${snapshot.connectionState == ConnectionState.done ? snapshot.data.toString() : 'loading'}"),
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
