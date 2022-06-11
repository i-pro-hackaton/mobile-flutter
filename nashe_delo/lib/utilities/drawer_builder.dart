import 'package:flutter/material.dart';
import 'package:nashe_delo/constants/routes.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';

Widget getDrawer(context, snapshot, SharedPreferencesAuthService spas) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Nashe delo'),
        ),
        ListTile(
          title: const Text('Главная'),
          onTap: () async {
            Navigator.pop(context);
            await Navigator.of(context)
                .pushNamedAndRemoveUntil(mainRoute, (_) => false);
          },
        ),
        if (snapshot.connectionState == ConnectionState.done &&
            !spas.isUserLoggedIn())
          ListTile(
            title: const Text('Вход'),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context).pushNamed(loginRoute);
            },
          ),
        if (snapshot.connectionState == ConnectionState.done &&
            spas.isUserLoggedIn())
          ListTile(
            title: const Text('Профиль'),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context)
                  .pushNamedAndRemoveUntil(profileRoute, (_) => false);
            },
          ),
        if (snapshot.connectionState == ConnectionState.done &&
            spas.isUserLoggedIn())
          ListTile(
            title: const Text('Команды'),
            onTap: () async {
              Navigator.pop(context);
              await Navigator.of(context)
                  .pushNamedAndRemoveUntil(teamsRoute, (_) => false);
            },
          ),
      ],
    ),
  );
}
