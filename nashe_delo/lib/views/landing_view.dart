import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      Navigator.of(context).pushReplacementNamed('login');
    }
    else {
      Navigator.of(context).pushReplacementNamed('home');
    }
  }

  @override
  Widget build(BuildContext context) => const Scaffold();
}