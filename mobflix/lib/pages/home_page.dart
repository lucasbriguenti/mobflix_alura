import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/controllers/video_controller.dart';
import 'package:mobflix/pages/widgets/videos_list.dart';
import 'package:mobflix/pages/widgets/carousel_videos.dart';
import 'package:mobflix/pages/widgets/categories_list.dart';
import 'package:mobflix/utils/color.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final videoController = context.watch<VideoController>();
    return Scaffold(
      backgroundColor: Colors.black87,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MobflixColors.purple,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text(
          'MOBFLIX',
          style: GoogleFonts.bebasNeue().copyWith(
            color: MobflixColors.blue,
            fontWeight: FontWeight.w400,
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: CarouselVideos(videos: videoController.getVideosForBanner()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: CategoriesList(
                categories: videoController.getCategories(),
              ),
            ),
          ),
          Expanded(
            child: VideosList(
              videos: videoController.getVideos(),
            ),
          ),
        ],
      ),
    );
  }
}
