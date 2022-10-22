import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/utils/color.dart';

class PreviewVideo extends StatelessWidget {
  final String? url;
  final Category? category;
  const PreviewVideo({required this.url, required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preview',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        if (category != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                color: category!.color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  category!.name,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        url == null || url!.length != 11
            ? const _ErrorVideoPreview()
            : CachedNetworkImage(
                imageUrl: 'https://img.youtube.com/vi/$url/0.jpg',
                width: 318,
                height: 180,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const _ErrorVideoPreview(),
              ),
      ],
    );
  }
}

class _ErrorVideoPreview extends StatelessWidget {
  const _ErrorVideoPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 318,
      color: MobflixColors.grey,
      child: Image.asset(
        'assets/images/youtube_logo.png',
        width: 60,
        height: 60,
      ),
    );
  }
}
