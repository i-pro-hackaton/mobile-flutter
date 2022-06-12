import 'package:flutter/material.dart';
import 'package:nashe_delo/views/request_view.dart';

import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';

class MainCardView extends StatefulWidget {
  const MainCardView({Key? key, required this.image}) : super(key: key);
  
  final String image;

  @override
  State<MainCardView> createState() => _MainCardViewState();
}

class _MainCardViewState extends State<MainCardView> {

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xffEFF1FB),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                children: [
                  const SizedBox(width: 3),
                  const CustomBackButton(),
                  const Spacer(),
                  GestureDetector(
                    child: Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xffDDE5ED),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                            Icons.favorite,
                            size: 18
                        )
                    )
                  ),
                  const SizedBox(width: 3)
                ]
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                            tag: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                    widget.image,
                                    width: double.infinity,
                                    fit: BoxFit.cover
                                )
                            )
                        ),
                        const SizedBox(height: 12),
                        Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE53331),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Text(
                                      "Здравоохранение",
                                      style: TextStyle(
                                          color: Colors.white
                                      )
                                  )
                              ),
                              const SizedBox(width: 4),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE13072),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Text(
                                      "Социальное",
                                      style: TextStyle(
                                          color: Colors.white
                                      )
                                  )
                              ),
                              const SizedBox(width: 4),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff394291),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Text(
                                      "Событийное",
                                      style: TextStyle(
                                          color: Colors.white
                                      )
                                  )
                              )
                            ]
                        ),
                        const SizedBox(height: 26),
                        Row(
                            children: [
                              const Flexible(
                                  child: Text(
                                      "Помощь в проведении Дня Донора",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                          color: Color(0xff262626)
                                      )
                                  )
                              ),
                              const SizedBox(width: 10),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff636467)
                                      ),
                                      borderRadius: BorderRadius.circular(2)
                                  ),
                                  child: const Text(
                                      "12",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(0xff636467)
                                      )
                                  )
                              )
                            ]
                        ),
                        const SizedBox(height: 13),
                        const Text(
                            "17 Мая, 8:00 - 4 Июля, 16:00, 2023г.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff636467)
                            )
                        ),
                        const SizedBox(height: 2),
                        const Text(
                            "Показать на карте",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Color(0xff2892F4)
                            )
                        ),
                        const SizedBox(height: 17),
                        Row(
                            children: [
                              Image.asset("images/logo.png"),
                              const SizedBox(width: 4),
                              const Text(
                                  "Ассоциация волонтёрских центров",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff2892F4)
                                  )
                              )
                            ]
                        ),
                        const SizedBox(height: 12),
                        Row(
                            children: [
                              const Text(
                                  "Мероприятие проводится ОНЛАЙН",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff7D7D7D)
                                  )
                              ),
                              const SizedBox(width: 4),
                              Container(
                                  height: 12,
                                  width: 12,
                                  padding: const EdgeInsets.all(2.25),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color(0xff65D133))
                                  ),
                                  child: Container(
                                      height: 7.5,
                                      width: 7.5,
                                      decoration: const BoxDecoration(
                                          color: Color(0xff65D133),
                                          shape: BoxShape.circle
                                      )
                                  )
                              )
                            ]
                        ),
                        const SizedBox(height: 19),
                        const Divider(color: Color.fromARGB(77, 0, 0, 0)),
                        const SizedBox(height: 15.99),
                        const Text(
                            '''
14 июня отмечается Всемирный день донора крови. И, конечно же, мы не можем его не отметить!
                            
                            
                            
15 июня ждём всех желающих сдать кровь. И, конечно же, нам не обойтись без помощи наших любимых волонтёров! Приглашаем активных и неравнодушных принять участие в организации.
                ''',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff636467)
                          )
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const RequestView()
                              )
                          ),
                          child: const CustomButton(text: "Подать заявку")
                        )
                      ]
                  )
              )
            )
          ]
        )
      )
    )
  );
}
