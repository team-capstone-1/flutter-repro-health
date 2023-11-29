import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/services/forum_services/forum_services.dart';

class ForumViewModel with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final ForumServices _forumServices = ForumServices();

  ForumModels? _forumList;
  ForumModels? get forumList => _forumList;

  ForumModels? _myForumList;
  ForumModels? get myForumList => _myForumList;

  List<String> kategoriListMap = [];

  String _searchText = '';
  String get searchText => _searchText;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged(String value) {
    _searchText = value;
    notifyListeners();
  }

  void toggleCategory(String kategori) {
    if (kategoriListMap.contains(kategori)) {
      kategoriListMap.remove(kategori);
    } else {
      kategoriListMap.add(kategori);
    }
    notifyListeners();
  }

  Future<void> getForumList() async {
    try {
      _forumList = await _forumServices.getListForum();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMyForumList({required String patientId}) async {
    try {
      _myForumList = await _forumServices.getListMyForum(patientId: patientId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
