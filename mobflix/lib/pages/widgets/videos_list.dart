import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/models/video_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VideosList extends StatelessWidget {
  final List<Video> videos;
  const VideosList({
    required this.videos,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 34,
              decoration: BoxDecoration(
                color: video.category.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  video.category.name,
                  style: GoogleFonts.roboto().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                launchUrlString(video.url);
              },
              child: SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.network(
                  video.urlThumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
