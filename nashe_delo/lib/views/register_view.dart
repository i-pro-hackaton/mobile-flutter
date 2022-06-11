import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:nashe_delo/constants/routes.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';
import 'package:nashe_delo/utilities/show_error_dialog.dart';
import 'package:nashe_delo/utilities/show_success_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final SharedPreferencesAuthService _sharedPreferencesAuthService;
  bool _sharedPreferencesAuthServiceWasInitialized = false;

  Future<void> initSharedPreferencesAuthService() async {
    if (_sharedPreferencesAuthServiceWasInitialized) {
      return;
    }
    _sharedPreferencesAuthService = await Future.delayed(
      // Delay for demonstration purposes
      const Duration(seconds: 0),
      () async => await SharedPreferencesAuthService.getInstance(),
    );
    _sharedPreferencesAuthServiceWasInitialized = true;
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _repeatPassword.dispose();
    _username.dispose();
    super.dispose();
  }

  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    /// Для сокрытия элементов интерфейса при открытии клавиатуры
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(title: const Text("Регистрация")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            if (!isKeyboard)
              const Text(
                "Регистрация",
                style: TextStyle(fontSize: 32),
              ),
            const SizedBox(height: 32),
            // TODO: Add dateOfBirth field!!
            TextField(
              controller: _username,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: "Логин"),
            ),
            TextField(
              controller: _name,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: "Имя"),
            ),
            TextField(
              controller: _surname,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(hintText: "Фамилия"),
            ),
            TextField(
              controller: _phone,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: const InputDecoration(hintText: "Телефон"),
            ),
            TextField(
              controller: _email,
              enableSuggestions: true,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "Электронная почта"),
            ),
            TextField(
              controller: _password,
              obscureText: !_obscurePassword,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Пароль"),
            ),
            TextField(
              controller: _repeatPassword,
              obscureText: !_obscurePassword,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Повторите пароль"),
            ),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  // fillColor: Colo,
                  value: _obscurePassword,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        _obscurePassword = value!;
                      },
                    );
                  },
                ),
                const Text("Показать пароль"),
              ],
            ),
            FutureBuilder(
              future: initSharedPreferencesAuthService(),
              builder: (context, snapshot) => TextButton(
                onPressed: () async {
                  if (_email.text.isEmpty ||
                      _password.text.isEmpty ||
                      _repeatPassword.text.isEmpty) {
                    return;
                  }
                  String username = _username.text;
                  String name = _name.text;
                  String surname = _surname.text;
                  String phone = _phone.text;
                  String email = _email.text;
                  String password = _password.text;
                  String passwordRepeat = _repeatPassword.text;
                  // Телефон без +7
                  // TODO: Add dateOfBirth
                  DateTime dateOfBirth = DateTime.now();
                  try {
                    if (password != passwordRepeat) {
                      throw PasswordVerificationMismatch();
                    }

                    await _sharedPreferencesAuthService.register(
                      username: username,
                      password: password,
                      name: name,
                      surname: surname,
                      email: email,
                      phone: phone,
                      dateOfBirth: dateOfBirth,
                    );
                    // await showSuccessDialog(
                    //   context: context,
                    //   content: '\\(^-^)/ Registration success! Please ',
                    // );
                    if (!mounted) return;
                    await Navigator.of(context).pushNamed(loginRoute);
                  } catch (e) {
                    await showErrorDialog(
                      context: context,
                      // TODO: Через функцию конвертировать исключение в описание ошибки
                      content: 'Ошибка регистрации: $e',
                    );
                  }
                },
                child: const Text("Зарегистрироваться"),
              ),
            ),
            // TextButton(
            //   onPressed: () async =>
            //       await Navigator.of(context).pushNamed(loginRoute),
            //   child: const Text("Уже зарегистрированы? Авторизоваться"),
            // )
          ],
        ),
      ),
    );
  }
}

class PasswordVerificationMismatch implements Exception {}
