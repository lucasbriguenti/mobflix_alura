import 'package:flutter/material.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/database/database.dart';
import 'package:mobflix/models/database/repositories/repository.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository extends Repository<Category> {
  late Database database;
  final _tableName = 'CATEGORY';
  final _sqlCreateTable = 'CREATE TABLE CATEGORY(NAME TEXT, COLOR TEXT)';

  @override
  void createTable(Database db) async {
    await db.execute(_sqlCreateTable);
    final initialCategories = [
      Category(name: 'Formula 1', color: Colors.red),
      Category(name: 'Formula Indy', color: Colors.grey),
      Category(name: 'Formula E', color: Colors.green),
      Category(name: 'Stock Car', color: Colors.brown),
    ];
    for (final category in initialCategories) {
      await save(category);
    }
  }

  Future delete(String name) async {
    await _openDatabase();
    await database.delete(_tableName, where: 'NAME = ?', whereArgs: [name]);
    await _closeDatabase();
  }

  Future<Category?> get(String name) async {
    try {
      await _openDatabase();
      final result = await database
          .query(_tableName, where: 'NAME = ?', whereArgs: [name]);
      final category = Category.fromMapDb(result.first);

      return category;
    } catch (e) {
      return null;
    } finally {
      await _closeDatabase();
    }
  }

  Future<List<Category>> getAll() async {
    await _openDatabase();
    final result = await database.query(_tableName);
    final categories = result.map((r) => Category.fromMapDb(r)).toList();
    await _closeDatabase();
    return categories;
  }

  Future save(Category object) async {
    await _openDatabase();
    var itemExists = await database
        .query(_tableName, where: 'NAME = ?', whereArgs: [object.name]);
    if (itemExists.isEmpty) {
      await database.insert(_tableName, object.toMapDb());
    } else {
      await database.update(_tableName, object.toMapDb(),
          where: 'NAME = ?', whereArgs: [object.name]);
    }
    await _closeDatabase();
  }

  Future _openDatabase() async {
    database = await getDatabase();
  }

  Future _closeDatabase() async {
    await database.close();
  }
}
