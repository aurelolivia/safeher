// import 'package:flutter/material.dart';
// import 'package:safeher/latihan_bottom_navigator.dart';
// import 'package:safeher/login_screen.dart';

// class LatihanDrawer extends StatefulWidget {
//   const LatihanDrawer({super.key});

//   @override
//   _LatihanDrawerState createState() => _LatihanDrawerState();
// }

// class _LatihanDrawerState extends State<LatihanDrawer> {
//   // Indeks halaman aktif saat ini
//   int _selectedIndex = 0;

//   // Daftar judul untuk AppBar berdasarkan halaman aktif
//   final List<String> _titles = [
//     'Halaman Circle Avatar',
//     'Halaman Grid view',
//   ];

//   // Daftar widget halaman tujuan
//   final List<Widget> _pages = [
//     const LatihanBottomNavigator(),
//     const LoginScreen(),
//   ];

//   // Fungsi untuk mengubah halaman aktif
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_titles[_selectedIndex]),
//         backgroundColor: Colors.blue,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const UserAccountsDrawerHeader(
//               accountName: Text('Budi Setiawan'),
//               accountEmail: Text('budi.setiawan@email.com'),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text(
//                   'B',
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),

//             // Menu 1: Beranda
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Latihan Circle Avatar'),
//               selected: _selectedIndex == 0,
//               onTap: () {
//                 _onItemTapped(0);
//                 Navigator.pop(context);
//               },
//             ),

//             // Menu 2: Pengaturan
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text('Latihan Grid View'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 _onItemTapped(1);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: _pages[_selectedIndex],
//     );
//   }
// }