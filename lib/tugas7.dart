import 'package:flutter/material.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool setuju = false;
  bool modeGelap = false;

  String? kategori;
  DateTime? tanggalLahir;
  TimeOfDay? waktuPengingat;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: modeGelap ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas 7 Flutter'),
        ),

        // DRAWER
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu Input',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.check_box),
                title: const Text('Syarat & Ketentuan'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text('Mode Gelap'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Pilih Kategori Produk'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Tanggal'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Jam'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        // BODY
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 1. CHECKBOX
              const Text(
                'Syarat & Ketentuan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(
                  'Saya menyetujui semua persyaratan yang berlaku',
                ),
                value: setuju,
                onChanged: (value) {
                  setState(() {
                    setuju = value!;
                  });
                },
              ),

              Text(
                setuju
                    ? 'Lanjutkan pendaftaran diperbolehkan'
                    : 'Anda belum bisa melanjutkan',
              ),

              const SizedBox(height: 25),

              // 2. SWITCH
              const Text(
                'Mode Gelap',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Aktifkan Mode Gelap'),
                value: modeGelap,
                onChanged: (value) {
                  setState(() {
                    modeGelap = value;
                  });
                },
              ),

              Text(
                modeGelap
                    ? 'Mode Gelap Aktif'
                    : 'Mode Terang Aktif',
              ),

              const SizedBox(height: 25),

              // 3. DROPDOWN
              const Text(
                'Pilih Kategori Produk',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kategori',
                ),
                initialValue: kategori,
                items: const [
                  DropdownMenuItem(
                    value: 'Elektronik',
                    child: Text('Elektronik'),
                  ),
                  DropdownMenuItem(
                    value: 'Pakaian',
                    child: Text('Pakaian'),
                  ),
                  DropdownMenuItem(
                    value: 'Makanan',
                    child: Text('Makanan'),
                  ),
                  DropdownMenuItem(
                    value: 'Lainnya',
                    child: Text('Lainnya'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    kategori = value;
                  });
                },
              ),

              const SizedBox(height: 10),

              Text(
                kategori == null
                    ? 'Belum memilih kategori'
                    : 'Anda memilih kategori: $kategori',
              ),

              const SizedBox(height: 25),

              // 4. DATE PICKER
              const Text(
                'Pilih Tanggal Lahir',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  DateTime? hasil = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );

                  if (hasil != null) {
                    setState(() {
                      tanggalLahir = hasil;
                    });
                  }
                },
                child: const Text('Pilih Tanggal Lahir'),
              ),

              if (tanggalLahir != null)
                Text(
                  'Tanggal Lahir: '
                  '${tanggalLahir!.day} '
                  '${namaBulan(tanggalLahir!.month)} '
                  '${tanggalLahir!.year}',
                ),

              const SizedBox(height: 25),

              // 5. TIME PICKER
              const Text(
                'Atur Pengingat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? hasil = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (hasil != null) {
                    setState(() {
                      waktuPengingat = hasil;
                    });
                  }
                },
                child: const Text('Pilih Waktu Pengingat'),
              ),

              if (waktuPengingat != null)
                Text(
                  'Pengingat diatur pukul: '
                  '${waktuPengingat!.format(context)}',
                ),

              const SizedBox(height: 30),

              // HASIL
              const Divider(),

              const Text(
                'Hasil Input',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Persetujuan: '
                '${setuju ? "Disetujui" : "Belum disetujui"}',
              ),

              Text(
                'Mode: '
                '${modeGelap ? "Gelap" : "Terang"}',
              ),

              Text(
                'Kategori: '
                '${kategori ?? "Belum dipilih"}',
              ),

              Text(
                'Tanggal: '
                '${tanggalLahir == null ? "Belum dipilih" : "${tanggalLahir!.day} ${namaBulan(tanggalLahir!.month)} ${tanggalLahir!.year}"}',
              ),

              Text(
                'Waktu: '
                '${waktuPengingat == null ? "Belum dipilih" : waktuPengingat!.format(context)}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String namaBulan(int bulan) {
    const bulanNama = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return bulanNama[bulan];
  }
}