import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nashe_delo/views/teams_profile_view.dart';
import 'package:nashe_delo/widgets/custom_back_button.dart';

class TeamsView extends StatefulWidget {
  const TeamsView({Key? key}) : super(key: key);

  @override
  State<TeamsView> createState() => _TeamsViewState();
}

class _TeamsViewState extends State<TeamsView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
                left: 23,
                right: 30
              ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  const Text(
                      "Команда",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const TeamsProfileView()
                        )
                    ),
                    child: Container(
                      height: 10,
                      width: 20,
                      color: Colors.transparent,
                      child: Row(
                          children: [
                            dot(),
                            const SizedBox(width: 3),
                            dot(),
                            const SizedBox(width: 3),
                            dot()
                          ]
                      )
                    )
                  )
                ]
            )
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("images/team.png"),
                  const SizedBox(height: 8),
                  const Text(
                      "I Pro",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  const SizedBox(height: 37),
                  const Text(
                      "Командные скилы",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  const SizedBox(height: 45),
                  Image.asset("images/skills.png"),
                  const SizedBox(height: 65.5),
                  Row(
                      children: [
                        const SizedBox(width: 32),
                        Image.asset("images/logo.png"),
                        const SizedBox(width: 8),
                        const Text(
                            "Хакатон-клуб",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0xff262626)
                            )
                        )
                      ]
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 183,
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(left: 12),
                          child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset("images/team_feed.png")
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                    "Территория смыслов",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Color(0xff262626)
                                    )
                                ),
                                const SizedBox(height: 9),
                                const Text(
                                    "14 Мая - 20 Июля, 21:00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Color(0xff636467)
                                    )
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                    "Россия, г. Москва",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Color(0xff636467)
                                    )
                                )
                              ]
                          )
                        )
                    )
                  ),
                  const SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            "Ваши добрые дела",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xff262626)
                            )
                        ),
                        const SizedBox(height: 21),
                        SizedBox(
                            height: 183,
                            child: ListView.builder(
                                itemCount: 2,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                    width: 165,
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: Image.asset("images/team_feed.png")
                                          ),
                                          const SizedBox(height: 7),
                                          const Text(
                                              "Отбор волонтёров на экологическую смену на базе Национального парка “Тункинский” в рамках Программы мобильности",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  color: Color(0xff262626)
                                              )
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                              children: [
                                                SvgPicture.asset("images/calendar.svg"),
                                                const SizedBox(width: 6),
                                                const Text(
                                                    "17 Мая - 4 Июля, 16:00",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Color(0xff636467)
                                                    )
                                                )
                                              ]
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "images/location.svg",
                                                    color: const Color(0xff7D7D7D)
                                                ),
                                                const SizedBox(width: 6),
                                                const Text(
                                                    "Россия, г. Москва",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Color(0xff636467)
                                                    )
                                                )
                                              ]
                                          )
                                        ]
                                    )
                                )
                            )
                        ),
                        const SizedBox(height: 25),
                        Container(
                            height: 38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0xffEAEAEA),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: const Text(
                                "Загрузить ещё",
                                style: TextStyle(
                                    color: Color(0xff262626)
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

  Container dot() => Container(
    height: 4,
    width: 4,
    decoration: const BoxDecoration(
      color: Color(0xff262626),
      shape: BoxShape.circle
    )
  );
}
