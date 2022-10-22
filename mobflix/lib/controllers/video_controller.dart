import 'package:flutter/material.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/video_model.dart';

class VideoController extends ChangeNotifier {
  List<Video> _videos = [];
  List<Category> _categories = [];
  VideoController() {
    _loadCategories();
    _loadVideos();
  }

  void _loadCategories() {
    _categories = [
      Category(name: 'Formula 1', color: Colors.red),
      Category(name: 'Formula Indy', color: Colors.grey),
      Category(name: 'Formula E', color: Colors.green),
      Category(name: 'Stock Car', color: Colors.brown),
    ];
  }

  void _loadVideos() {
    final formula1Category =
        _categories.firstWhere((element) => element.name == 'Formula 1');
    final formulaIndyCategory =
        _categories.firstWhere((element) => element.name == 'Formula Indy');
    final formulaECategory =
        _categories.firstWhere((element) => element.name == 'Formula E');
    final stockCarCategory =
        _categories.firstWhere((element) => element.name == 'Stock Car');
    _videos = [
      Video(
        url: 'https://www.youtube.com/watch?v=0J7cmh3MLp4',
        category: formula1Category,
        showInBanner: true,
      ),
      Video(
        url: 'https://www.youtube.com/watch?v=35_ajbPPcm0',
        category: formula1Category,
        showInBanner: false,
      ),
      Video(
        url: 'https://www.youtube.com/watch?v=rgsM_4i0t40',
        category: formulaIndyCategory,
        showInBanner: true,
      ),
      Video(
        url: 'https://www.youtube.com/watch?v=E4sZcP3kwGs',
        category: formulaECategory,
        showInBanner: true,
      ),
      Video(
        url: 'https://www.youtube.com/watch?v=hzFaD1p9WfM',
        category: stockCarCategory,
        showInBanner: true,
      ),
    ];
  }

  List<Video> getVideos() => _videos;

  List<Video> getVideosForBanner() =>
      _videos.where((video) => video.showInBanner).toList();

  List<Category> getCategories() => _categories;

  void addVideo(Video video) {
    _videos.add(video);
    notifyListeners();
  }
}
