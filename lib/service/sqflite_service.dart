import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class SqfliteService {
  // Membuat instance internal yang sama di seluruh aplikasi
  static final SqfliteService _instance = SqfliteService._internal();

  factory SqfliteService() => _instance;

  SqfliteService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();

    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ppkdju.db');

    // Membuka database
    return await openDatabase(
      path,
      version: 1,

      // onCreate hanya berjalan 1x saat database pertama kali dibuat di HP
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            nama TEXT,
            hobi TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<bool> registerUser(UserModel dataUser) async {
    final db = await database;

    try {
      await db.insert('users', dataUser.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> loginUser(String email, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }

    return null;
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }

    return null;
  }
}