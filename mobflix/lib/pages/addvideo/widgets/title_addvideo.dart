import 'package:flutter/material.dart';

class TitleAddVideo extends StatelessWidget {
  const TitleAddVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Cadastre um vídeo',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
    );
  }
}
