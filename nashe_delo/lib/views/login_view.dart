import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nashe_delo/views/signup_view.dart';
import 'package:nashe_delo/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool remember = true;

  TextEditingController email = TextEditingController(),
      password = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "Nashe Delo",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 48,
                            color: Color(0xff262626)
                        )
                    ),
                    const SizedBox(height: 8),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "Ещё нет аккаунта? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xff636467)
                              )
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const SignupView()
                                )
                            ),
                              child: const Text(
                                  "Зарегистрироваться",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff2892F4)
                                  )
                              )
                          )
                        ]
                    ),
                    const SizedBox(height: 56),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  "Вход",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 36,
                                      color: Color(0xff262626)
                                  )
                              ),
                              const SizedBox(height: 16),
                              Container(
                                  height: 40,
                                  padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 8.5,
                                      bottom: 4.75,
                                      right: 12
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xffBFBFBF)),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Row(
                                      children: [
                                        SvgPicture.asset("images/email.svg"),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: TextField(
                                              controller: email,
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Электропочта*",
                                                    hintStyle: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Color(0xffBFBFBF)
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  )
                              ),
                              const SizedBox(height: 32),
                              Container(
                                  height: 40,
                                  padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 8.5,
                                      bottom: 4.75,
                                      right: 12
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xffBFBFBF)),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Row(
                                      children: [
                                        SvgPicture.asset("images/email.svg"),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: TextField(
                                              controller: password,
                                                obscureText: true,
                                                decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Пароль*",
                                                    hintStyle: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Color(0xffBFBFBF)
                                                    )
                                                )
                                            )
                                        )
                                      ]
                                  )
                              ),
                              const SizedBox(height: 27),
                              Row(
                                  children: [
                                    Checkbox(
                                        value: remember,
                                        onChanged: (value) => setState(() => remember = !remember)
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                        "Запомнить меня",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff262626)
                                        )
                                    ),
                                    const Spacer(),
                                    const Text(
                                        "Забыли пароль?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xff2892F4)
                                        )
                                    )
                                  ]
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () async {
                                  Response response = await http.post(
                                      Uri.parse("http://i-pro-backend.herokuapp.com/login"),
                                      body: <String, String>{
                                        "username": email.text,
                                        "password": password.text,
                                      }
                                  );
                                  print(response.body);
                                  print(response.statusCode);
                                  if (response.statusCode == 200) {
                                    Map<String, dynamic> body = jsonDecode(response.body);
                                    final prefs = await SharedPreferences.getInstance();
                                    await prefs.setString('token', body["access_token"]);
                                    Navigator.of(context).pushReplacementNamed('home');
                                  }
                                },
                                child: const CustomButton(text: "Войти")
                              ),
                              const SizedBox(height: 70),
                              Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0xff2892F4)),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: const Text(
                                      "Регистрация организатора",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
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
      )
  );
}
