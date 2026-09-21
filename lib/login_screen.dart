// import 'package:safeher/database/db_helper.dart';
// import 'package:safeher/extention/navigator.dart';
// import 'package:safeher/model/user_model.dart';
// import 'package:safeher/service/shared_preference.dart';
// import 'package:flutter/material.dart';
// import 'package:safeher/tugas9.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginState();
// }

// class _LoginState extends State<LoginScreen> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final userController = TextEditingController();
//   final passController = TextEditingController();

//   void register() async {
//     final user = userController.text.trim();
//     final pass = passController.text;

//     if (user.isEmpty || pass.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('akun berhasil dibuat')));
//       return;
//     }

//     final pengguna = UserModelSQL(email: user, password: pass);

//     bool success = await DBHelper().registerUser(pengguna);

//     if (!mounted) return; // Menghindari linter warning: 'Don't use BuildContext across async gaps'

//     if (success) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
//     } else {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
//     }
//   }

//   void login() async {
//     final user = userController.text.trim();
//     final pass = passController.text;

//     if (user.isEmpty || pass.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('akun berhasil dibuat')));
//       return;
//     }

//     final pengguna = await DBHelper().loginUser(user, pass);

//     if (!mounted) return; // Menghindari linter warning penggunaan BuildContext

//     if (pengguna != null) {
//       Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (_) => const HomePage()),
//         (route) => false,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Login gagal! email atau Password salah.'),
//         ),
//       );
//     }
//   }

//   final _formKey = GlobalKey<FormState>();

//   final emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // =========================
//                     // ICON
//                     // =========================
//                     const Icon(Icons.lock, size: 80, color: Colors.blue),

//                     const SizedBox(height: 24),

//                     // =========================
//                     // TITLE
//                     // =========================


//                     const SizedBox(height: 8),

//                     // =========================
//                     // SUBTITLE
//                     // =========================
//                     const Text(
//                       'Silakan masuk ke akun Anda',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),

//                     const SizedBox(height: 32),

//                     // =========================
//                     // EMAIL
//                     // =========================
//                     TextFormField(
//                       controller: emailController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email wajib diisi';
//                         } else if (!value.contains('@')) {
//                           return 'Format email tidak valid';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         hintText: 'Masukkan email',
//                         prefixIcon: const Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // =========================
//                     // PASSWORD
//                     // =========================
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'Masukkan password',
//                         prefixIcon: const Icon(Icons.lock),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 24),

//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           login();
//                         }
//                       },
//                       child: Text('LOGIN'),
//                     ),

//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           register();
//                         }
//                       },
//                       child: Text('REGISTER'),
//                     ),

// // =========================
// // BUTTON
// // =========================
// Visibility(
//   visible: false,
//   child: SizedBox(
//     width: double.infinity,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.red,
//         // textStyle: TextStyle(color: Colors.white),
//       ),
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text('Data '),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Email: ${emailController.text}'),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     context.pop();
//                     PreferenceHandler.setLogin(true);
//                     context.push(
//                       HalamanTerimaKasih(
//                         email: emailController.text,
//                       ),
//                     );

//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) =>
//                     //         HalamanTerimaKasih(
//                     //       email: emailController.text,
//                     //     ),
//                     //   ),
//                     // );
//                   },
//                   child: Text('Lanjutkan'),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//       child: const Text(
//         'Login',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   ),
// ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HalamanTerimaKasih extends StatelessWidget {
//   final String email;
//   const HalamanTerimaKasih({super.key, required this.email});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Konfirmasi')),
//       body: Column(
//         children: [
//           Center(
//             child: Text(
//               'Terima kasih, $email',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ), // Text
//           ),

//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 PreferenceHandler.logOut();
//                 context.pushAndRemoveAll(LoginScreen());
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 // textStyle: TextStyle(color: Colors.white),
//               ),
//               child: Text("Logout"),
//             ),
//           ),
//         ],
//       ), // Center
//     ); // Scaffold
//   }
// }
