import 'package:flutter/material.dart';
import 'package:mobflix/controllers/video_controller.dart';
import 'package:mobflix/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => VideoController()),
      ],
      child: const MaterialApp(
        title: 'Mobflix',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
