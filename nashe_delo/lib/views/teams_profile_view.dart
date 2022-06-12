import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nashe_delo/widgets/custom_back_button.dart';
import 'package:nashe_delo/widgets/custom_tile.dart';

class TeamsProfileView extends StatefulWidget {
  const TeamsProfileView({Key? key}) : super(key: key);

  @override
  State<TeamsProfileView> createState() => _TeamsProfileViewState();
}

class _TeamsProfileViewState extends State<TeamsProfileView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
          children: [
            Row(
                children: const [
                  SizedBox(width: 23),
                  CustomBackButton(),
                  Spacer(),
                  Text(
                      "Команда",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  Spacer()
                ]
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          const SizedBox(height: 29),
                          Image.asset("images/team.png"),
                          const SizedBox(height: 8),
                          const Text(
                              "Загрузить фото",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xff2892F4)
                              )
                          ),
                          const SizedBox(height: 32),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11,
                                            horizontal: 17
                                        ),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffEFEFEF),
                                            borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: const Text(
                                            "I Pro",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: Color(0xff262626)
                                            )
                                        )
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                        "Укажите название вашей команды",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff7D7D7D)
                                        )
                                    ),
                                    const SizedBox(height: 24),
                                    const CustomTile(
                                      image: "settings",
                                      text: "Настройки команды"
                                    ),
                                    const SizedBox(height: 12),
                                    const CustomTile(
                                        image: "add",
                                        text: "Добавить нового участника"
                                    ),
                                    const SizedBox(height: 46),
                                    Container(
                                        height: 48,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff1B1B1B),
                                            borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: const Text(
                                            "Выйти из команды",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Colors.white
                                            )
                                        )
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                )
            )
          ]
      )
    )
  );
}
