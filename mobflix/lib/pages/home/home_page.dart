import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/controllers/video_controller.dart';
import 'package:mobflix/pages/home/widgets/videos_list.dart';
import 'package:mobflix/pages/home/widgets/carousel_videos.dart';
import 'package:mobflix/pages/home/widgets/categories_list.dart';
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
        onPressed: () {
          Navigator.of(context).pushNamed('addvideo');
        },
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
            child: FutureBuilder(
                future: videoController.getVideosForBanner(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return const Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData && snapshot.data != null) {
                        if (snapshot.data!.isNotEmpty) {
                          return CarouselVideos(videos: snapshot.data!);
                        }

                        return const Center(
                          child: Text('Não a videos'),
                        );
                      }
                  }
                  return const Text('Erro desconhecido');
                }),
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
            child: FutureBuilder(
                future: videoController.getVideos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return VideosList(
                      videos: snapshot.data!,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
