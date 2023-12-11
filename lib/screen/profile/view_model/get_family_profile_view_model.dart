import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class GetFamilyProfileViewModel extends ChangeNotifier {

  final ProfileService _profileServices = ProfileService();
  ProfileService? get profileService  => _profileServices;

  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;

  Future<void> fetchProfileData({required BuildContext context}) async {
    try {
      final String token = await SharedPreferencesUtils().getToken();
      print(token);
      if (token.isNotEmpty) {
        _profileList = await _profileServices.getProfileModel(context: context);
        notifyListeners();
      } else {
        print('Token is empty!');
      }
    } catch (e) {
      print('Error fetching profile data: $e');
      print(_profileList);
    }
  }

  Future<void> fetchProfileDataId({
    required BuildContext context, 
    required idPatients
    }) async {
    try {
      final String token = await SharedPreferencesUtils().getToken();
      print(token);
      if (token.isNotEmpty) {
        _profileList = await _profileServices.getProfileModelId(context: context, idPatients: idPatients);
        notifyListeners();
      } else {
        print('Token is empty!');
      }
    } catch (e) {
      print('Error fetching: $e');
    }
  }
}
