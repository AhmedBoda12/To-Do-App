import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'TB_Tasks';

  static initDb() async {
    if (_db != null) {
      return;
    } else {
      try {
        var databasePath = '${await getDatabasesPath()}todo.db';
        _db = await openDatabase(
          databasePath,
          version: _version,
          onCreate: (db, version) async {
            await db.execute(
                'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, '
                'note TEXT, date STRING, startTime STRING, endTime STRING, remind INTEGER,'
                'repeat STRING, color INTEGER, isCompleted INTEGER)');
          },
        );
        log('Database created');
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
