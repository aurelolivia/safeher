import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w900,
            ),
            ),
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w200,
            ),
            ),
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w500,
            ),
            ),
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w300,
            ),
            ),
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w100,
            ),
            ),
            Text('Login Screen',
         style: TextStyle(
         fontWeight: FontWeight.w800,
            ),
            ),
            Image.asset(
              'assets/icons/btnSigninwithGoogle.png',
              width: 200,
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              color: Color(0xFFF8623A),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
