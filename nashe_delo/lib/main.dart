import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nashe_delo/views/landing_view.dart';
import 'package:nashe_delo/widgets/custom_navbar.dart';
import 'package:nashe_delo/views/main_view.dart';
import 'package:nashe_delo/views/registration_view.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
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
      initialRoute: 'landing',
      routes: {
        'landing': (context) => const LandingView(),
        'login': (context) => const RegistrationView(),
        'home': (context) => const CustomNavbar(),
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
