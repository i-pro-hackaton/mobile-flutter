import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:nashe_delo/constants/routes.dart';
import 'package:nashe_delo/services/auth/shared_preferences_auth_service.dart';
import 'package:nashe_delo/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_sharedPreferencesAuthService.isUserLoggedIn()) {
        await Navigator.of(context)
            .pushNamedAndRemoveUntil(mainRoute, (route) => false);
      }
    });
  }

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  bool rememberMeCheck = false;

  @override
  void dispose() {
    _usernameNode.dispose();
    _passwordNode.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
        leading: Icon(Icons.arrow_back, color: Color(0xffbfbfbf)),

        // Card(
        // shape:
        // RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // color: const Color(0xffEAEAEA),
        // child:
        //   Transform.rotate(
        // angle: 45 * 3.1415 / 180,
        // child: Icon(
        //   Icons.add,
        //   size: 40,
        //   color: Color(0xffbfbfbf),
        // ),
      ),
      // ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              if (!isKeyboard) const SizedBox(height: 50),
              if (!isKeyboard)
                const Text(
                  "Nashe Delo",
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                ),
              if (!isKeyboard)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Ещё нет аккаунта?",
                        style: TextStyle(
                          color: Color(0xff636467),
                          fontSize: 16,
                        )),
                    TextButton(
                      onPressed: () async =>
                          await Navigator.of(context).pushNamed(registerRoute),
                      child: const Text(
                        "Зарегистрироваться",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              Row(children: const [
                Text(
                  "Вход",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              const SizedBox(height: 32),
              TextFormField(
                controller: _username,
                enableSuggestions: true,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Электропочта*",
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Пароль*",
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMeCheck,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              rememberMeCheck = value!;
                            },
                          );
                        },
                      ),
                      const Text("Запомнить меня"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Редирект на забыли пароль
                    },
                    child: const Text("Забыли пароль?"),
                  )
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (!_sharedPreferencesAuthService.isUserLoggedIn()) {
                    String username = _username.text;
                    String password = _password.text;
                    try {
                      await _sharedPreferencesAuthService.login(
                          username: username, password: password);
                      if (!mounted) return;
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(mainRoute, (route) => false);
                    } catch (e) {
                      await showErrorDialog(
                        context: context,
                        // TODO: Через функцию конвертировать исключение в описание ошибки
                        content: "Ошибка входа: $e",
                      );
                    }
                  } else {
                    // Unreachable
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.5);
                      }

                      return null; // Use the component's default.
                    },
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Войти"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                // padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: const Color(0xff1890FF), width: 3.0),
                  color: const Color(0xff1890FF),
                ),
                child: ElevatedButton(
                  // TODO:Редирект на регистраци для организаторов
                  onPressed: () {},

                  style: ButtonStyle(
                    // border
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: FutureBuilder(
                    future: initSharedPreferencesAuthService(),
                    builder: (context, snapshot) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Регистрация организатора",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
