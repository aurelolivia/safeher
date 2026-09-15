import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:safeher/latihan_Localstore/home.dart';
import 'package:safeher/latihan_Localstore/register.dart';
import 'package:safeher/model/user_model.dart';
import 'package:safeher/service/shared_preference.dart';
import 'package:safeher/service/sqflite_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailInputController = TextEditingController();
  final _inputPassController = TextEditingController();
  final _cekStateForm = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 32),
                child: Text(
                  'Selamat datang kembali',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 8),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 90),
                child: Text(
                  'Silahkan masuk untuk memulai kembali sesi anda di aplikasi xyz',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF434654),
                  ),
                ),
              ),

              SizedBox(height: 32),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(45),
                  child: Image.asset(
                    'assets/images/hallo.jpg',
                    height: 250,
                    width: 350,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Form(
                key: _cekStateForm,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMAIL',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF434654),
                        ),
                      ),

                      SizedBox(height: 6.5),

                      TextFormField(
                        controller: _emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          }

                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!emailRegex.hasMatch(value)) {
                            return 'Format email tidak valid (contoh: nama@email.com)';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color(0xFFC3C6D6),
                          ),
                          hintText: 'jhon@examplemail.com',
                          hintStyle: TextStyle(
                            color: Color(0xFFC3C6D6),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFC3C6D6),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 29.5),

                      Text(
                        'PASSWORD',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF434654),
                        ),
                      ),

                      SizedBox(height: 6.5),

                      TextFormField(
                        controller: _inputPassController,
                        obscureText: _isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '************',
                          hintStyle: TextStyle(
                            color: Color(0xFFC3C6D6),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFC3C6D6),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFC3C6D6),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }

                          if (value.length < 6) {
                            return 'Password minimal harus 6 karakter';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 6.5),

                      Text(
                        'Lupa Password ?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003D9B),
                        ),
                      ),

                      SizedBox(height: 30),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF003D9B),
                          foregroundColor: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          if (_cekStateForm.currentState!.validate()) {
                            UserModel? loginSukses =
                                await SqfliteService().loginUser(
                              _emailInputController.text.trim(),
                              _inputPassController.text.trim(),
                            );

                            if (!context.mounted) return;

                            if (loginSukses != null) {
                              await SharedPreferenceService()
                                  .setLoginStatus(true);

                              if (!context.mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Selamat datang, ${loginSukses.nama}!',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              if (!context.mounted) return;

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Home(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Email atau Password salah!',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Masuk'),
                            SizedBox(width: 8),
                            Icon(Icons.logout_outlined),
                          ],
                        ),
                      ),

                      SizedBox(height: 8),

                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color(0xFF434654),
                              fontSize: 16.0,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Belum punya akun ?',
                              ),
                              TextSpan(
                                text: ' Daftar disini',
                                style: const TextStyle(
                                  color: Color(0xFF003D9B),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Register(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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