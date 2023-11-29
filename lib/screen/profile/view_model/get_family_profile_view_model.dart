import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class GetFamilyProfileViewModel extends ChangeNotifier {
  late ProfileModel _profileModel;
  bool _isLoading = true;

  ProfileModel get profileModel => _profileModel;
  bool get isLoading => _isLoading;

  Future<void> fetchProfileData(ProfileService profileService) async {
    try {
      _profileModel = await profileService.getProfileModel();
      _isLoading = false;
    } catch (e) {
      print('Error fetching profile data: $e');
    }
    notifyListeners();
  }
}
