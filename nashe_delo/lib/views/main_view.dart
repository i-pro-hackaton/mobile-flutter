import 'package:flutter/material.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';
import 'package:nashe_delo/utilities/drawer_builder.dart';

enum MenuAction {
  logout,
  info,
  login,
  profile,
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSharedPreferencesAuthService(),
      builder: (context, snapshot) {
        return Scaffold(
          // TODO: Вынести drawer в отдельный (FutureBuilder?) элемент и добавить его на все экраны
          drawer: snapshot.connectionState == ConnectionState.done
              ? getDrawer(context, snapshot, _sharedPreferencesAuthService)
              : null,
          appBar: AppBar(
            title: const Text("Главная"),
            // actions: [
            //   PopupMenuButton<MenuAction>(
            //     onSelected: (value) async {
            //       switch (value) {
            //         case MenuAction.logout:
            //           final shouldLogout = await showLogOutDialog(context);
            //           if (shouldLogout) {
            //             // Logout
            //             switch (snapshot.connectionState) {
            //               case ConnectionState.none:
            //               case ConnectionState.waiting:
            //               case ConnectionState.active:
            //                 // Might happen but never in usual
            //                 break;
            //               case ConnectionState.done:
            //                 _sharedPreferencesAuthService.logout();
            //                 if (!mounted) return;
            //                 await Navigator.of(context).pushNamedAndRemoveUntil(
            //                     loginRoute, (route) => false);
            //                 break;
            //             }
            //           }
            //           break;
            //         case MenuAction.info:
            //           // TODO: Добавить инфо если вообще требуется.
            //           break;
            //         case MenuAction.login:
            //           await Navigator.of(context).pushNamed(loginRoute);
            //           break;
            //         case MenuAction.profile:
            //           await Navigator.of(context).pushNamed(profileRoute);
            //           break;
            //       }
            //     },
            //     itemBuilder: (context) => [
            //       if (snapshot.connectionState == ConnectionState.done &&
            //           _sharedPreferencesAuthService.isUserLoggedIn())
            //         const PopupMenuItem<MenuAction>(
            //           value: MenuAction.logout,
            //           child: Text("Выйти"),
            //         )
            //       else
            //         const PopupMenuItem<MenuAction>(
            //           value: MenuAction.login,
            //           child: Text("Войти"),
            //         ),
            //       if (snapshot.connectionState == ConnectionState.done &&
            //           _sharedPreferencesAuthService.isUserLoggedIn())
            //         const PopupMenuItem<MenuAction>(
            //           value: MenuAction.profile,
            //           child: Text("Профиль"),
            //         ),
            //       const PopupMenuItem<MenuAction>(
            //         value: MenuAction.info,
            //         child: Text("Инфо"),
            //       )
            //     ],
            //   )
            // ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Nobody here but us chicken 🐤🐤🐤"),
                if (snapshot.connectionState == ConnectionState.done)
                  Text(
                    "Пользователь авторизован? ${_sharedPreferencesAuthService.isUserLoggedIn() ? 'Да' : 'Нет'}",
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
