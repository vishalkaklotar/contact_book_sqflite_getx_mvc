import 'dart:async';

import 'package:contact_book_sqflite_getx_mvc/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  DatabaseService._();

  static final DatabaseService _instance = DatabaseService._();

  static Future<DatabaseService> initialize() async {
    await _instance._createDatabase();
    return _instance;
  }

  Future<void> _createDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contacts.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createContactsTable,
    );
  }

  Future<List<Map<String, Object?>>?> fetch() async {
    String sql = 'SELECT * FROM contacts';
    return await _database?.rawQuery(sql);
  }

  Future<int?> addContact(Contact contact) async {
    Map<String, dynamic> map = contact.toMap();
    map['id'] = null;
    return await _database?.insert('contacts', map);
  }

  Future<void> updateContact(Contact contact) async {
    String sql =
        'UPDATE contacts SET name="${contact.name}", contact="${contact.contact}" WHERE id=${contact.id}';
    await _database?.rawUpdate(sql);
  }

  Future<void> deleteContact(int id) async {
    String sql = 'DELETE FROM contacts WHERE id = $id';
    await _database?.rawDelete(sql);
  }

  Future<FutureOr<void>> _createContactsTable(Database db, int version) async {
    String sql =
        'CREATE TABLE contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, contact TEXT)';
    await db.execute(sql);
  }
}
