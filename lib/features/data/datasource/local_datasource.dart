import 'package:customer_flutter_offline/core/database/database_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatasource {
  Future<List<dynamic>> getAll({required String tableName});
  Future<void> insert({required String tableName, required dynamic data});
  Future<void> updateById({
    required String tableName,
    required dynamic data,
    required int id,
  });
  Future<void> deleteById({required String tableName, required int id});
}

@Injectable(as: LocalDatasource)
class LocalDatasourceImpl implements LocalDatasource {
  LocalDatasourceImpl(this._dbHelper);

  final DatabaseHelper _dbHelper;

  @override
  Future<List<dynamic>> getAll({required String tableName}) async {
    final db = await _dbHelper.database;
    final result = await db.query(tableName);
    return result as List;
  }

  @override
  Future<void> insert({required String tableName, required data}) async {
    final db = await _dbHelper.database;
    await db.insert(
      tableName,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    throw UnimplementedError();
  }

  @override
  Future<void> updateById({
    required String tableName,
    required dynamic data,
    required int id,
  }) async {
    final db = await _dbHelper.database;
    await db.update(
      tableName,
      data.toMap(),
      where: 'id = ?',
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteById({required String tableName, required int id}) async {
    final db = await _dbHelper.database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
