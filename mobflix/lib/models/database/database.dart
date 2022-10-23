// ignore_for_file: depend_on_referenced_packages

import 'package:mobflix/models/database/repositories/category_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'mobflix.db');
  return openDatabase(path, onCreate: ((db, version) {
    CategoryRepository().createTable(db);
  }), version: 1);
}
