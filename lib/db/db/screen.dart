import 'package:safeher/db/db/users.dart';
import 'package:flutter/material.dart';
import 'package:safeher/db/db/database_helper.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Screen> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final passwordController = TextEditingController();
  final kotaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> daftar() async {
    if (!formKey.currentState!.validate()) return;

    final user = User(
      nama: namaController.text,
      email: emailController.text,
      nomorHp: hpController.text,
      password: passwordController.text,
      asalKota: kotaController.text,
    );

    await DatabaseHelper.instance.insertUser(user);

    namaController.clear();
    emailController.clear();
    hpController.clear();
    passwordController.clear();
    kotaController.clear();

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
      ),
    );
  }

  Widget input(
    String label,
    TextEditingController controller, {
    bool password = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label wajib diisi';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran User'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      input('Nama', namaController),
                      const SizedBox(height: 12),

                      input('Email', emailController),
                      const SizedBox(height: 12),

                      input('Nomor HP', hpController),
                      const SizedBox(height: 12),

                      input(
                        'Password',
                        passwordController,
                        password: true,
                      ),
                      const SizedBox(height: 12),

                      input('Asal Kota', kotaController),
                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: daftar,
                          child: const Text('Daftar'),
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Peserta Terdaftar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      FutureBuilder<List<User>>(
                        future: DatabaseHelper.instance.getUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text(
                              'Belum ada peserta',
                            );
                          }

                          final users = snapshot.data!;

                          return ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];

                              return Card(
                                child: ListTile(
                                  title: Text(user.nama),
                                  subtitle: Text(
                                    '${user.email}\n'
                                    '${user.nomorHp} • ${user.asalKota}',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}