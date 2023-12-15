import 'package:flutter/foundation.dart';
import 'package:reprohealth_app/models/article_models.dart';

class BookmarkProvider extends ChangeNotifier {
  List<bool> _isBookmarked = [];

  List<bool> get isBookmarked => _isBookmarked;

  void initialize(
      List<ArticleModels> allArticles, List<ArticleModels> bookmarkedArticles) {
    _isBookmarked = List.generate(allArticles.length, (index) {
      return bookmarkedArticles
          .any((element) => element.id == allArticles[index].id);
    });
  }

  void toggleBookmark(int index) {
    _isBookmarked[index] = !_isBookmarked[index];
    notifyListeners();
  }
}
