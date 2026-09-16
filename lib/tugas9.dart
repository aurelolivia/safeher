import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =====================================================
// 1. LIST <STRING>
// =====================================================

List<String> kategoriList = [
  'Buah-buahan',
  'Sayuran',
  'Elektronik',
  'Pakaian Pria',
  'Pakaian Wanita',
  'Alat Tulis Kantor',
  'Buku & Majalah',
  'Peralatan Dapur',
  'Makanan Ringan',
  'Minuman',
];

// =====================================================
// 2. LIST <MAP<String, dynamic>>
// =====================================================

List<Map<String, dynamic>> kategoriMap = [
  {
    'nama': 'Buah-buahan',
    'icon': Icons.apple,
  },
  {
    'nama': 'Sayuran',
    'icon': Icons.eco,
  },
  {
    'nama': 'Elektronik',
    'icon': Icons.devices,
  },
  {
    'nama': 'Pakaian Pria',
    'icon': Icons.man,
  },
  {
    'nama': 'Pakaian Wanita',
    'icon': Icons.woman,
  },
  {
    'nama': 'Alat Tulis Kantor',
    'icon': Icons.edit,
  },
  {
    'nama': 'Buku & Majalah',
    'icon': Icons.menu_book,
  },
  {
    'nama': 'Peralatan Dapur',
    'icon': Icons.kitchen,
  },
  {
    'nama': 'Makanan Ringan',
    'icon': Icons.fastfood,
  },
  {
    'nama': 'Minuman',
    'icon': Icons.local_drink,
  },
];

// =====================================================
// 3. MODEL PRODUCT
// =====================================================

class Product {
  final String nama;
  final String deskripsi;
  final String gambar;
  final int harga;

  Product({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.harga,
  });
}

// =====================================================
// 10 DATA PRODUK KATEGORI 1: BUAH-BUAHAN
// =====================================================

List<Product> produk = [
  Product(
    nama: 'Apel Fuji',
    deskripsi: 'Apel Fuji segar dengan rasa manis dan renyah.',
    gambar:
        'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6',
    harga: 25000,
  ),
  Product(
    nama: 'Pisang Cavendish',
    deskripsi: 'Pisang Cavendish matang dengan tekstur lembut.',
    gambar:
        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e',
    harga: 18000,
  ),
  Product(
    nama: 'Jeruk',
    deskripsi: 'Jeruk segar dengan rasa manis dan sedikit asam.',
    gambar:
        'https://images.unsplash.com/photo-1547514701-42782101795e',
    harga: 22000,
  ),
  Product(
    nama: 'Mangga',
    deskripsi: 'Mangga harum manis dengan rasa manis dan segar.',
    gambar:
        'https://images.unsplash.com/photo-1553279768-865429fa0078',
    harga: 30000,
  ),
  Product(
    nama: 'Semangka',
    deskripsi: 'Semangka merah segar dengan kandungan air tinggi.',
    gambar:
        'https://images.unsplash.com/photo-1563114773-84221bd62daa',
    harga: 28000,
  ),
  Product(
    nama: 'Stroberi',
    deskripsi: 'Stroberi merah segar dengan rasa manis dan sedikit asam.',
    gambar:
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6',
    harga: 35000,
  ),
  Product(
    nama: 'Anggur',
    deskripsi: 'Anggur segar dengan tekstur renyah dan rasa manis.',
    gambar:
        'https://images.unsplash.com/photo-1537640538966-79f369143f8f',
    harga: 40000,
  ),
  Product(
    nama: 'Nanas',
    deskripsi: 'Nanas segar dengan aroma khas dan rasa manis asam.',
    gambar:
        'https://images.unsplash.com/photo-1550258987-190a2d41a8ba',
    harga: 20000,
  ),
  Product(
    nama: 'Pepaya',
    deskripsi: 'Pepaya matang dengan tekstur lembut dan rasa manis.',
    gambar:
        'https://images.unsplash.com/photo-1526318472351-c75fcf070305',
    harga: 17000,
  ),
  Product(
    nama: 'Alpukat',
    deskripsi: 'Alpukat segar dengan tekstur lembut dan creamy.',
    gambar:
        'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578',
    harga: 32000,
  ),
];

// =====================================================
// APP
// =====================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kategori Toko',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kategori Toko'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Map'),
              Tab(text: 'Model'),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            ListKategori(),
            MapKategori(),
            ModelProduk(),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// HALAMAN 1 - LIST
// =====================================================

class ListKategori extends StatelessWidget {
  const ListKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategoriList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(kategoriList[index]),
        );
      },
    );
  }
}

// =====================================================
// HALAMAN 2 - LIST MAP
// =====================================================

class MapKategori extends StatelessWidget {
  const MapKategori({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategoriMap.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            kategoriMap[index]['icon'],
            size: 30,
          ),
          title: Text(
            kategoriMap[index]['nama'],
          ),
        );
      },
    );
  }
}

// =====================================================
// HALAMAN 3 - MODEL
// =====================================================

class ModelProduk extends StatelessWidget {
  const ModelProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produk.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        return ListProduk(
          product: produk[index],
        );
      },
    );
  }
}

// =====================================================
// WIDGET LIST PRODUK
// =====================================================

class ListProduk extends StatelessWidget {
  final Product product;

  const ListProduk({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),

        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.gambar,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.image_not_supported,
                size: 50,
              );
            },
          ),
        ),

        title: Text(
          product.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(product.deskripsi),
            const SizedBox(height: 5),
            Text(
              'Rp ${product.harga}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}