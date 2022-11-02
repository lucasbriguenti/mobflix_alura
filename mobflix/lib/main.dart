import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/controllers/video_controller.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/database/register_repositories.dart';
import 'package:mobflix/models/database/repositories/category_repository.dart';
import 'package:mobflix/utils/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerRepositories();
  final repo = GetIt.I.get<CategoryRepository>();
  await repo.save(Category(name: 'Teste', color: Colors.white));
  final categories = await repo.getAll();
  for (var c in categories) {
    print(c.name);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              VideoController(categoryRepository: GetIt.I.get()),
        ),
      ],
      child: MaterialApp(
        title: 'Mobflix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        ),
        initialRoute: 'home',
        onGenerateRoute: getRoutes,
      ),
    );
  }
}
