import 'package:flutter/material.dart';
import 'package:nashe_delo/views/profile_settings_view.dart';
import 'package:nashe_delo/views/teams_profile_view.dart';
import 'package:nashe_delo/widgets/custom_tile.dart';

import '../widgets/custom_dot.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "Профиль",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Color(0xff262626)
        )
      ),
      actions: [
        GestureDetector(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const ProfileSettingsView()
                )
            ),
            child: Row(
                children: const [
                  CustomDot(),
                  SizedBox(width: 3),
                  CustomDot(),
                  SizedBox(width: 3),
                  CustomDot(),
                ]
            )
        ),
        const SizedBox(width: 30)
      ]
    ),
    body: Column(
      children: [
        Image.asset("images/EgorS.png"),
        const SizedBox(height: 12),
        const Text(
          "Смурыгин Егор",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xff262626)
          )
        ),
        const SizedBox(height: 48),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomTile(image: "request", text: "Мои заявки"),
              const SizedBox(height: 8),
              const CustomTile(image: "book", text: "Книжки волонтёра"),
              const SizedBox(height: 24),
              const Text(
                  "Ваши направления",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xff262626)
                  )
              ),
              const SizedBox(height: 10),
              Image.asset("images/directions.png"),
              const SizedBox(height: 43),
              const CustomTile(image: "about", text: "О приложении"),
              const SizedBox(height: 8),
              const CustomTile(image: "help", text: "Написать в техподдержку")
            ]
          )
        )
      ]
    )
  );
}