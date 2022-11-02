import 'package:flutter/material.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/database/repositories/category_repository.dart';
import 'package:mobflix/models/video_model.dart';

class VideoController extends ChangeNotifier {
  List<Category> _categories = [];
  final CategoryRepository categoryRepository;
  VideoController({required this.categoryRepository}) {
    _loadCategories();
  }

  Future _loadCategories() async {
    _categories = await categoryRepository.getAll();
  }

  Future<List<Video>> getVideos() async {
    if (_categories.isEmpty) return [];

    final formula1Category =
        _categories.firstWhere((element) => element.name == 'Formula 1');
    final formulaIndyCategory =
        _categories.firstWhere((element) => element.name == 'Formula Indy');
    final formulaECategory =
        _categories.firstWhere((element) => element.name == 'Formula E');
    final stockCarCategory =
        _categories.firstWhere((element) => element.name == 'Stock Car');
    return [
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

  Future<List<Video>> getVideosForBanner() async {
    final videos = await getVideos();
    return videos.where((video) => video.showInBanner).toList();
  }

  List<Category> getCategories() => _categories;

  void addVideo(Video video) {
    notifyListeners();
  }
}
