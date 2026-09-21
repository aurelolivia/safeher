import 'package:flutter/material.dart';
import 'package:safeher/db/db/database_helper.dart';
import 'package:safeher/db/db/users.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final passwordController = TextEditingController();
  final kotaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    _usersFuture = DatabaseHelper.instance.getUsers();
  }

  // =========================
  // TAMBAH DATA
  // =========================

  Future<void> daftar() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final user = User(
      nama: namaController.text.trim(),
      email: emailController.text.trim(),
      nomorHp: hpController.text.trim(),
      password: passwordController.text,
      asalKota: kotaController.text.trim(),
    );

    await DatabaseHelper.instance.insertUser(user);

    setState(() {
      _loadUsers();
    });

    namaController.clear();
    emailController.clear();
    hpController.clear();
    passwordController.clear();
    kotaController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
      ),
    );
  }

  // =========================
  // EDIT DATA
  // =========================

  void editUser(User user) {
    final editNamaController =
        TextEditingController(text: user.nama);

    final editEmailController =
        TextEditingController(text: user.email);

    final editHpController =
        TextEditingController(text: user.nomorHp);

    final editPasswordController =
        TextEditingController(text: user.password);

    final editKotaController =
        TextEditingController(text: user.asalKota);

    final editFormKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Data User'),
          content: SingleChildScrollView(
            child: Form(
              key: editFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: editNamaController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Nama wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: editEmailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Email wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: editHpController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor HP',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Nomor HP wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: editPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Password wajib diisi';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: editKotaController,
                    decoration: const InputDecoration(
                      labelText: 'Asal Kota',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Asal Kota wajib diisi';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),

            ElevatedButton(
              onPressed: () async {
                if (!editFormKey.currentState!.validate()) {
                  return;
                }

                final updatedUser = User(
                  id: user.id,
                  nama: editNamaController.text.trim(),
                  email: editEmailController.text.trim(),
                  nomorHp: editHpController.text.trim(),
                  password: editPasswordController.text,
                  asalKota: editKotaController.text.trim(),
                );

                await DatabaseHelper.instance
                    .updateUser(updatedUser);

                if (!mounted) return;

                Navigator.pop(context);

                setState(() {
                  _loadUsers();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Data berhasil diperbarui',
                    ),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // DELETE DATA
  // =========================

  void hapusUser(User user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text(
            'Apakah kamu yakin ingin menghapus data ${user.nama}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),

            ElevatedButton(
              onPressed: () async {
                await DatabaseHelper.instance
                    .deleteUser(user.id!);

                if (!mounted) return;

                Navigator.pop(context);

                setState(() {
                  _loadUsers();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Data berhasil dihapus',
                    ),
                  ),
                );
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  // =========================
  // INPUT FIELD
  // =========================

  Widget inputField(
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
        if (value == null || value.trim().isEmpty) {
          return '$label wajib diisi';
        }

        return null;
      },
    );
  }

  // =========================
  // BUILD
  // =========================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendaftaran User'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: formKey,

          child: SingleChildScrollView(
            child: Column(
              children: [
                inputField(
                  'Nama',
                  namaController,
                ),

                const SizedBox(height: 12),

                inputField(
                  'Email',
                  emailController,
                ),

                const SizedBox(height: 12),

                inputField(
                  'Nomor HP',
                  hpController,
                ),

                const SizedBox(height: 12),

                inputField(
                  'Password',
                  passwordController,
                  password: true,
                ),

                const SizedBox(height: 12),

                inputField(
                  'Asal Kota',
                  kotaController,
                ),

                const SizedBox(height: 16),

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
                  future: _usersFuture,

                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text(
                        'Error: ${snapshot.error}',
                      );
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
                              '${user.nomorHp} • '
                              '${user.asalKota}',
                            ),

                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                  onPressed: () {
                                    editUser(user);
                                  },
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                  ),
                                  onPressed: () {
                                    hapusUser(user);
                                  },
                                ),
                              ],
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
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    hpController.dispose();
    passwordController.dispose();
    kotaController.dispose();

    super.dispose();
  }
}