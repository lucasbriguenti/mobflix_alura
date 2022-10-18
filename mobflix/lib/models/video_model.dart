// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobflix/models/category_model.dart';

class Video {
  final String url;
  final Category category;
  final bool showInBanner;
  Video({
    required this.url,
    required this.category,
    required this.showInBanner,
  });

  String get urlThumbnail {
    final id = url.substring(url.length - 11);
    return 'https://img.youtube.com/vi/$id/0.jpg';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'category': category.toMap(),
      'showInBanner': showInBanner,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      url: map['url'] as String,
      category: Category.fromMap(map['category'] as Map<String, dynamic>),
      showInBanner: map['showInBanner'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);
}
