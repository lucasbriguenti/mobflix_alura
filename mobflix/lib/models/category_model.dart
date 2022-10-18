// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

class Category {
  final String name;
  final Color color;
  Category({
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'color': color,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      color: map['color'] as Color,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
