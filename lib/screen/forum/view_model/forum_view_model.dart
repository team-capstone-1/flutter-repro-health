import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/models/profile_models/profile_models.dart';
import 'package:reprohealth_app/services/forum_services/forum_services.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class ForumViewModel with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  final ForumServices _forumServices = ForumServices();
  final ProfileService _profileServices = ProfileService();

  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;

  ForumModels? _forumList;
  ForumModels? get forumList => _forumList;

  ForumModels? _myForumList;
  ForumModels? get myForumList => _myForumList;

  List<String> kategoriListMap = [];

  List<ResponseDataForum>? searchResults;

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
      kategoriListMap.clear();
    } else {
      kategoriListMap.clear();
      kategoriListMap.add(kategori);
    }
    notifyListeners();
  }

  // GET FORUM
  Future<void> getForumList() async {
    try {
      _forumList = await _forumServices.getListForum();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // GET FORUM BY ID
  Future<void> getMyForumList() async {
    try {
      _myForumList = await _forumServices.getListMyForum(
          patientId: _profileList?.response?.first.id ?? '');
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // DATA API GET PROFILE
  Future<void> getProfile({required BuildContext context}) async {
    try {
      _profileList = await _profileServices.getProfileModel(context: context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void searchForum(String query) {
    if (query.isEmpty) {
      searchResults = null;
    } else {
      searchResults = forumList?.response?.where((forum) {
        return forum.title?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            forum.content?.toLowerCase().contains(query.toLowerCase()) == true;
      }).toList();
    }
    notifyListeners();
  }

  // SET DATE FORUM
  String calculateDaysAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays} hari';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam';
    } else {
      return '${difference.inMinutes} menit';
    }
  }

  Future<void> deleteForum({
    required String forumId,
    required String title,
    required String content,
    required bool anonymous,
    required BuildContext context,
  }) async {
    try {
      await ForumServices().deleteForum(
        forumId: forumId,
        title: title,
        content: content,
        anonymous: anonymous,
        context: context,
      );

      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.detailForumView,
          (route) => false,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Kendala: $e");
      }
    }
  }
}
