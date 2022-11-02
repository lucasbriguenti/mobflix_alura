import 'package:get_it/get_it.dart';
import 'package:mobflix/models/database/repositories/category_repository.dart';

void registerRepositories() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => CategoryRepository());
}
