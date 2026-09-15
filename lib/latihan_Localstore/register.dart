import 'package:flutter/material.dart';
import 'package:safeher/service/sqflite_service.dart';
import 'package:safeher/latihanfigma.dart';

import '../model/user_model.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  @override
State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _inputRegisterNama = TextEditingController();
  final _inputEmailRegister = TextEditingController();
  final _inputPassRegister = TextEditingController();
  final _inputHobiRegister = TextEditingController();
  final _cekValidasiFormRegister = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  void dispose() {
    _inputRegisterNama.dispose();
    _inputEmailRegister.dispose();
    _inputPassRegister.dispose();
    _inputHobiRegister.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _cekValidasiFormRegister,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buat Akun Baru',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Silahkan lengkapi data diri anda untuk membuat akun pada aplikasi xyz.',
                      ),

                      SizedBox(height: 31.5),

                      Text(
                        'NAMA LENGKAP',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 4),

                      TextFormField(
                        controller: _inputRegisterNama,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF737685),
                          ),
                          hintText: 'Ex: Budi Dharmaone',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama lengkap belum di isi';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: 10),

                      Text(
                        'ALAMAT EMAIL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 4.5),

                      TextFormField(
                        controller: _inputEmailRegister,
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
                            Icons.email,
                            color: Color(0xFF737685),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Ex: budi_one@mail.com',
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        'HOBI / KEGEMARAN',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 4.5),

                      TextFormField(
                        controller: _inputHobiRegister,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kolom Hobi/Kegemaran harus diisi !';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Ex: Nonton Drama Korea',
                          prefixIcon: Icon(
                            Icons.accessibility,
                            color: Color(0xFF737685),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        'PASSWORD',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 6.5),

                      TextFormField(
                        controller: _inputPassRegister,
                        obscureText: _isObscure,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '************',
                          hintStyle: TextStyle(
                            color: Color(0xFFC3C6D6),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF737685),
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
                              color: Color(0xFF737685),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
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
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_cekValidasiFormRegister.currentState!
                            .validate()) {
                          UserModel dataBaru = UserModel(
                            email: _inputEmailRegister.text.trim(),
                            nama: _inputRegisterNama.text.trim(),
                            hobi: _inputHobiRegister.text.trim(),
                            password: _inputPassRegister.text.trim(),
                          );

                          bool isSukses =
                              await SqfliteService().registerUser(
                            dataBaru,
                          );

                          if (!context.mounted) return;

                          if (isSukses) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Registrasi Berhasil! Silakan Login.',
                                ),
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Registrasi Gagal! Email mungkin sudah terdaftar.',
                                ),
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Daftar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}