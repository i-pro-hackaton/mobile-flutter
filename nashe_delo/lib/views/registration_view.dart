import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_button.dart';
import 'login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

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
                    "Войдите, чтобы продолжить",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xff262626)
                    )
                ),
                const SizedBox(height: 11),
                const Text(
                    "Откройте для себя полный функционал приложения.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff7D7D7D)
                    )
                ),
                const SizedBox(height: 64),
                GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginView()
                        )
                    ),
                    child: const CustomButton(text: "Войти или Зарегестрироваться")
                )
              ]
          )
        )
      ]
    )
  );
}
