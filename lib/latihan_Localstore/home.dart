import 'package:flutter/material.dart';

import 'package:safeher/service/shared_preference.dart';
import 'package:safeher/latihanfigma.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
 @override
State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home : Belajar local Storage'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Text("Nama Saya : "),
          Text("Alamat Email : "),
          Text("Hobi Saya : "),
          Padding(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await SharedPreferenceService().setLoginStatus(false);

                  if (!context.mounted) return;

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}