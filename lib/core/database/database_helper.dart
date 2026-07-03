import 'dart:io';

import 'package:customer_flutter_offline/core/database/database_strings.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton()
class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();

    return _database!;
  }

  Future<Database> _initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DatabaseStrings.dbName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    final String sqlScript = await rootBundle.loadString(
      DatabaseStrings.pathSQL,
    );
    final List<String> sqlStatements = sqlScript
        .split(';')
        .where((String s) => s.trim().isNotEmpty)
        .toList();

    for (final String sql in sqlStatements) {
      await db.execute(sql);
    }
  }
}
