import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              "images/congratulations.png",
              fit: BoxFit.cover
          ),
          Positioned(
              bottom: 107,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "Поздравляем!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Color(0xff262626)
                        )
                    ),
                    const SizedBox(height: 14),
                    const Text(
                        "Ваша заявка успешно отправлена",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff7D7D7D)
                        )
                    ),
                    const SizedBox(height: 94),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacementNamed('home'),
                      child: const CustomButton(text: "Отлично")
                    )
                  ]
              )
          )
        ]
    )
  );
}