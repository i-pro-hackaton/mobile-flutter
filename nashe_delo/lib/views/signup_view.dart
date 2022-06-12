import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:nashe_delo/widgets/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool agree = true;

  TextEditingController name = TextEditingController(),
      surname = TextEditingController(),
      dateOfBirth = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      username = TextEditingController(),
      password = TextEditingController(),
      password1 = TextEditingController();

  void signUp() async {
    Response da = await http.post(
        Uri.parse("http://i-pro-backend.herokuapp.com/registration"),
        headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "name": "asd",
        "surname": "adsda",
        "date_of_birth": "01.01.2022",
        "email": "tagidick.tagidick@gmail.com",
        "phone": "+79969267921",
        "username": "ф",
        "password": "1"
      })
    );
    print(da.body);
    print(da.statusCode);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
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
                  "Уже зарегистрированы?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff636467)
                  )
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    " Войти",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff2892F4)
                    )
                  )
                )
              ]
            ),
            const SizedBox(height: 53),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                      "Регистрация",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 36,
                          color: Color(0xff262626)
                      )
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 8.5,
                      left: 24,
                      right: 24,
                      bottom: 4.75
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffBFBFBF)),
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Имя*",
                        hintStyle: TextStyle(
                          color: Color(0xffBFBFBF)
                        )
                      )
                    )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: TextField(
                          controller: surname,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Фамилия*",
                              hintStyle: TextStyle(
                                  color: Color(0xffBFBFBF)
                              )
                          )
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                                controller: dateOfBirth,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Дата рождения*",
                                    hintStyle: TextStyle(
                                        color: Color(0xffBFBFBF)
                                    )
                                )
                            )
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              dateOfBirth.text = dateTime.toString();
                            },
                            child: SvgPicture.asset("images/date_of_birth.svg")
                          )
                        ]
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: TextField(
                          controller: email,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Электропочта*",
                              hintStyle: TextStyle(
                                  color: Color(0xffBFBFBF)
                              )
                          )
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                    controller: phone,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Телефон",
                                        hintStyle: TextStyle(
                                            color: Color(0xffBFBFBF)
                                        )
                                    )
                                )
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset("images/phone.svg")
                            )
                          ]
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: TextField(
                          controller: username,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Логин",
                              hintStyle: TextStyle(
                                  color: Color(0xffBFBFBF)
                              )
                          )
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                  obscureText: true,
                                    controller: password,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Пароль*",
                                        hintStyle: TextStyle(
                                            color: Color(0xffBFBFBF)
                                        )
                                    )
                                )
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset("images/eye.svg")
                            )
                          ]
                      )
                  ),
                  const SizedBox(height: 24),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 8.5,
                          left: 24,
                          right: 24,
                          bottom: 4.75
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffBFBFBF)),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                    obscureText: true,
                                    controller: password1,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Повторите пароль*",
                                        hintStyle: TextStyle(
                                            color: Color(0xffBFBFBF)
                                        )
                                    )
                                )
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset("images/eye.svg")
                            )
                          ]
                      )
                  ),
                  const SizedBox(height: 22),
                  Row(
                      children: [
                        Checkbox(
                          value: agree,
                          onChanged: (value) => setState(() => agree = !agree),
                        ),
                        Flexible(
                            child: RichText(
                                text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Соглашаюсь на обработку",
                                          style: TextStyle(
                                              color: Color(0xff262626)
                                          )
                                      ),
                                      TextSpan(
                                          text: "моих персональных данных",
                                          style: TextStyle(
                                              color: Color(0xff2892F4),
                                              decoration: TextDecoration.underline
                                          )
                                      ),
                                      TextSpan(
                                          text: "и принимаю",
                                          style: TextStyle(
                                              color: Color(0xff262626)
                                          )
                                      ),
                                      TextSpan(
                                          text: "пользовательское соглашение",
                                          style: TextStyle(
                                              color: Color(0xff2892F4),
                                              decoration: TextDecoration.underline
                                          )
                                      )
                                    ]
                                )
                            )
                        )
                      ]
                  ),
                  const SizedBox(height: 26),
                  GestureDetector(
                    onTap: () async {
                      if (password.text == password1.text) {
                        Response response = await http.post(
                            Uri.parse("http://i-pro-backend.herokuapp.com/registration"),
                            body: <String, String>{
                              "name": name.text,
                              "surname": surname.text,
                              "date_of_birth": dateOfBirth.text,
                              "email": email.text,
                              "phone": phone.text,
                              "username": username.text,
                              "password": password.text
                            }
                        );
                        if (response.statusCode == 200) {
                          Map<String, dynamic> body = jsonDecode(response.body);
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('token', body["access_token"]);
                          Navigator.of(context).pushReplacementNamed('home');
                        }
                      }
                    },
                    child: const CustomButton(text: "Зарегистрироваться")
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
  );
}
