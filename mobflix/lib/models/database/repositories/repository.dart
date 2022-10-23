import 'package:sqflite/sqlite_api.dart';

abstract class Repository<T> {
  void createTable(Database db);
  Future<T> save(T object);
  Future delete(int id);
  Future<List<T>> getAll();
}
