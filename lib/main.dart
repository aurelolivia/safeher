import 'package:flutter/material.dart';
import 'package:safeher/latihan_Localstore/home.dart';
import 'package:safeher/latihan_Localstore/login.dart';
import 'package:safeher/latihan_bottom_navigator.dart';
import 'package:safeher/service/shared_preference.dart';
import 'package:safeher/latihan_Localstore/validasi.dart';
import 'package:safeher/tugas10.dart';
import 'package:safeher/tugas9.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool statusLogin =
      await SharedPreferenceService().getLoginStatus();

  runApp(
    MyApp(
      isLoggedIn: statusLogin,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.isLoggedIn,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: FormPage (),
    );
  }
}