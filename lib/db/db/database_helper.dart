import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:safeher/db/db/users.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            password TEXT NOT NULL,
            asal_kota TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute('DROP TABLE IF EXISTS users');

        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            email TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            password TEXT NOT NULL,
            asal_kota TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // INSERT
  Future<int> insertUser(User user) async {
    final db = await database;

    return await db.insert(
      'users',
      user.toMap(),
    );
  }

  // SELECT
  Future<List<User>> getUsers() async {
    final db = await database;

    final result = await db.query(
      'users',
      orderBy: 'id DESC',
    );

    return result.map((map) => User.fromMap(map)).toList();
  }

  // UPDATE
  Future<int> updateUser(User user) async {
    final db = await database;

    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // DELETE
  Future<int> deleteUser(int id) async {
    final db = await database;

    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}