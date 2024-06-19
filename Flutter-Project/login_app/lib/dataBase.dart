import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final String username;
  final String password;

  User(this.username, this.password);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      map['username'],
      map['password'],
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  static Database? _db;

  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'users.db');

    // Create the database table
    final db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE Users (
          username TEXT NOT NULL,
          password TEXT NOT NULL
        )
      ''');
    });
    return db;
  }

  Future<void> saveUser(User user) async {
    final db = await this.db;
    await db.insert('Users', user.toMap());
  }

  Future<User?> getUser(String username) async {
    final db = await this.db;
    final maps =
        await db.query('Users', where: 'username = ?', whereArgs: [username]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
