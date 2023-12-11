import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class GetFamilyProfileViewModel extends ChangeNotifier {

  final ProfileService _profileServices = ProfileService();
  ProfileService? get profileService  => _profileServices;

  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;
  

  Future<void> fetchProfileData({required BuildContext context}) async {
    try {
      _profileList = await _profileServices.getProfileModel(context: context);
      notifyListeners();
    } catch (e) {
      e;
    }
  }

  Future<void> fetchProfileDataId({
    required BuildContext context,
    required idPatients
    }) async {
    try {
      _profileList = await _profileServices.getProfileModelId(context: context, idPatients: idPatients);
      notifyListeners();
    } catch (e) {
      (e);
    }
  }
}
