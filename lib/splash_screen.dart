import 'package:flutter/material.dart';
import 'package:safeher/service/shared_preference.dart';
import 'package:safeher/login_screen.dart';
import 'package:safeher/extention/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(Duration(seconds: 3));
    if (PreferenceHandler.isLogin == true) {
      context.pushAndRemoveAll(HalamanTerimaKasih(email: "email"));
    } else {
      context.pushAndRemoveAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(child: Image.asset("assets/images/sawit.jpeg")),
      ),
    );
  }
}