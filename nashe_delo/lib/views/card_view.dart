import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nashe_delo/views/card_congratulations_view.dart';
import 'package:nashe_delo/widgets/custom_back_button.dart';
import 'package:nashe_delo/widgets/custom_button.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {

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
                      "Карта",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Color(0xff262626)
                      )
                  ),
                  Spacer()
                ]
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height: 269,
                        child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                  "images/background.png",
                                  fit: BoxFit.cover
                              ),
                              Image.asset("images/card.png"),
                              Positioned(
                                  bottom: 24.13,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 17.27,
                                                left: 14.13,
                                                right: 10.25,
                                                bottom: 19.94
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12.5612)
                                            ),
                                            child: Column(
                                                children: [
                                                  Row(
                                                      children: const [
                                                        Text(
                                                            "Баланс команды",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 9.4209,
                                                                color: Color(0xff7D7D7D)
                                                            )
                                                        ),
                                                        Text(
                                                            "757 ч.*",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 12.5612,
                                                                color: Color(0xff262626)
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                  Row(
                                                      children: const [
                                                        Text(
                                                            "Баланс личный:",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 9.4209,
                                                                color: Color(0xff7D7D7D)
                                                            )
                                                        ),
                                                        Text(
                                                            "526 ч.*",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.w600,
                                                                fontSize: 12.5612,
                                                                color: Color(0xff262626)
                                                            )
                                                        )
                                                      ]
                                                  )
                                                ]
                                            )
                                        ),
                                        const SizedBox(width: 7.85),
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 12.56,
                                                left: 10.21,
                                                right: 10.99,
                                                bottom: 20.47
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12.5612)
                                            ),
                                            child: Column(
                                                children: [
                                                  SvgPicture.asset("images/download.svg"),
                                                  const SizedBox(height: 6.28),
                                                  const Text(
                                                      "Условия использования",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 9.4209,
                                                          color: Color(0xff7D7D7D)
                                                      )
                                                  )
                                                ]
                                            )
                                        )
                                      ]
                                  )
                              )
                            ]
                        )
                    ),
                    const SizedBox(height: 24.13),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 90,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFCEEDF),
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Image.asset("images/promo.png")
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 24,
                                                bottom: 17
                                            ),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                      "Приведите друга, бла-бла-бла",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: 16,
                                                          color: Color(0xff262626)
                                                      )
                                                  ),
                                                  SizedBox(height: 9),
                                                  Text(
                                                      "Другу - то-то. А вам будет вот это",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Color(0xff7D7D7D)
                                                      )
                                                  )
                                                ]
                                            )
                                        )
                                      ]
                                  )
                              ),
                              const SizedBox(height: 37),
                              const Text(
                                  "Что посетить?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: Color(0xff262626)
                                  )
                              ),
                              const SizedBox(height: 24),
                              Row(
                                  children: const [
                                    Text(
                                        "Кинотеатр Pushka",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Color(0xff262626)
                                        )
                                    ),
                                    Spacer(),
                                    Text(
                                        "10 ч.*",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.5612,
                                            color: Color(0xff262626)
                                        )
                                    )
                                  ]
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                  "г. Москва, Староватутинский 14",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff262626)
                                  )
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                  "Откроется в 9:00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff7D7D7D)
                                  )
                              ),
                              const SizedBox(height: 16),
                              Image.asset("images/card_feed.png"),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CardCongratulationsView())),
                                child: CustomButton(text: "Потратить часы")
                              ),
                              const SizedBox(height: 100),
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
