import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/database/database.dart';
import 'package:mobflix/models/database/repositories/repository.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository extends Repository<Category> {
  late Database database;
  final _tableName = 'CATEGORY';
  final _sqlCreateTable = 'CREATE TABLE CATEGORY(NAME TEXT, COLOR TEXT)';

  @override
  void createTable(Database db) {
    db.execute(_sqlCreateTable);
  }

  @override
  Future delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<Category> get(String name) async {
    await _openDatabase();
    final result =
        await database.query(_tableName, where: 'NAME = ?', whereArgs: [name]);
    final category = Category.fromMap(result.first);
    await _closeDatabase();
    return category;
  }

  @override
  Future<List<Category>> getAll() async {
    await _openDatabase();
    final result = await database.query(_tableName);
    final categories = result.map((r) => Category.fromMap(r)).toList();
    await _closeDatabase();
    return categories;
  }

  @override
  Future<Category> save(Category object) {
    // TODO: implement save
    throw UnimplementedError();
  }

  Future _openDatabase() async {
    database = await getDatabase();
  }

  Future _closeDatabase() async {
    await database.close();
  }
}
