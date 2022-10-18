import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobflix/models/video_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CarouselVideos extends StatelessWidget {
  final List<Video> videos;
  const CarouselVideos({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 1,
        height: 200,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        autoPlayInterval: const Duration(seconds: 6),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: videos.map((video) {
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.network(
              video.urlThumbnail,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () {
                launchUrlString(video.url);
              },
              child: const Text('Assista agora'),
            ),
          ],
        );
      }).toList(),
    );
  }
}
