import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final kotaController = TextEditingController();

  void daftar() {
    String nama = namaController.text;
    String email = emailController.text;
    String hp = hpController.text;
    String kota = kotaController.text;

    if (nama.isEmpty || email.isEmpty || kota.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nama, Email, dan Kota wajib diisi!'),
        ),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email harus mengandung @'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Data Pendaftaran'),
          content: Text(
            'Nama: $nama\n'
            'Email: $email\n'
            'No HP: $hp\n'
            'Kota: $kota',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KonfirmasiPage(
                      nama: nama,
                      kota: kota,
                    ),
                  ),
                );
              },
              child: const Text('Lanjut'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
              ),
            ),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),

            TextField(
              controller: hpController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Nomor HP',
              ),
            ),

            TextField(
              controller: kotaController,
              decoration: const InputDecoration(
                labelText: 'Kota',
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: daftar,
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

class KonfirmasiPage extends StatelessWidget {
  final String nama;
  final String kota;

  const KonfirmasiPage({
    super.key,
    required this.nama,
    required this.kota,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi'),
      ),
      body: Center(
        child: Text(
          'Terima kasih, $nama dari $kota telah mendaftar.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}