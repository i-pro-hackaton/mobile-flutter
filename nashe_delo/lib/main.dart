import 'package:flutter/material.dart';
import 'package:nashe_delo/constants/routes.dart';
import 'package:nashe_delo/views/main_view.dart';
import 'package:nashe_delo/views/login_view.dart';
import 'package:nashe_delo/views/profile_view.dart';
import 'package:nashe_delo/views/register_view.dart';
import 'package:nashe_delo/views/teams_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nashe Delo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        mainRoute: (context) => const MainView(),
        profileRoute: (context) => const ProfileView(),
        teamsRoute: (context) => const TeamsView(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MainView();
  }
}
