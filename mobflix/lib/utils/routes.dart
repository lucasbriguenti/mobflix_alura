import 'package:flutter/material.dart';
import 'package:mobflix/pages/addvideo/addvideo_page.dart';
import 'package:mobflix/pages/home/home_page.dart';

Route<dynamic>? getRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(builder: ((context) => const HomePage()));
    case 'addvideo':
      return MaterialPageRoute(
        builder: (context) => AddVideo(),
      );
  }

  return MaterialPageRoute(builder: ((context) => const HomePage()));
}
