import 'package:sqflite/sqlite_api.dart';

abstract class Repository<T> {
  void createTable(Database db);
}
