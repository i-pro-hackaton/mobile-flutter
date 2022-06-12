import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nashe_delo/views/profile_view.dart';
import 'package:nashe_delo/views/teams_view.dart';

import '../views/card_view.dart';
import '../views/favorite_view.dart';
import '../views/main_view.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _index = 0;

  Widget indexPage(int index) {
    switch (index) {
      case 0:
        return const MainView();
      case 1:
        return const FavoriteView();
      case 2:
        return const CardView();
      case 3:
        return const TeamsView();
      case 4:
        return const ProfileView();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        indexPage(_index),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.only(
              top: 12,
              left: 11,
              right: 11,
              bottom: 10
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                bottomNavigationBarItem(
                  "main",
                  "Главная",
                  0
                ),
                bottomNavigationBarItem(
                    "favorite",
                    "Избранное",
                    1
                ),
                bottomNavigationBarItem(
                    "card",
                    "Карта",
                    2
                ),
                bottomNavigationBarItem(
                    "team",
                    "Команда",
                    3
                ),
                bottomNavigationBarItem(
                    "profile",
                    "Профиль",
                    4
                ),
              ]
            )
          )
        )
      ]
    )
  );

  GestureDetector bottomNavigationBarItem(String image, text, int index) => GestureDetector(
    onTap: () => setState(() => _index = index),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7.4
      ),
      decoration: BoxDecoration(
        color: _index == index ? const Color(0xffDDE5ED) : Colors.transparent,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Container(
          //     height: 11,
          //     width: 11,
          //     alignment: Alignment.center,
          //     decoration: const BoxDecoration(
          //       color: Color(0xffFF0000),
          //       shape: BoxShape.circle
          //     ),
          //     child: const Text(
          //       "3",
          //       style: TextStyle(
          //         color: Colors.white
          //       )
          //     )
          //   )
          // ),
          Column(
              children: [
                SvgPicture.asset(
                    "images/$image.svg",
                    color: _index == index
                        ? const Color(0xff2892F4)
                        : const Color(0xff7D7D7D)
                ),
                const SizedBox(height: 5),
                Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 6,
                        color: _index == index
                            ? const Color(0xff2892F4)
                            : const Color(0xff7D7D7D)
                    )
                )
              ]
          )
        ]
      )
    )
  );
}
