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

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Вход")),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: initSharedPreferencesAuthService(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Добро пожаловать!",
                      style: TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _username,
                      enableSuggestions: true,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: "Логин"),
                    ),
                    TextField(
                      controller: _password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(hintText: "Пароль"),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (!_sharedPreferencesAuthService.isUserLoggedIn()) {
                          String username = _username.text;
                          String password = _password.text;
                          try {
                            await _sharedPreferencesAuthService.login(
                                username: username, password: password);
                            if (!mounted) return;
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                mainRoute, (route) => false);
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
                      child: const Text("Вход"),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(registerRoute),
                      child: const Text("Нет аккаунта? Зарегистририроваться"),
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
