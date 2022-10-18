// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/models/category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Container(width: 25),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Container(
          width: 150,
          decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              category.name,
              style: GoogleFonts.roboto().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
