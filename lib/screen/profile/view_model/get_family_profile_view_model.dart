import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class GetFamilyProfileViewModel extends ChangeNotifier {

  final ProfileService _profileServices = ProfileService();
  ProfileService? get profileService  => _profileServices;

  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;

  Future<void> fetchProfileData({required BuildContext context}) async {
    try {
      final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
      final String token = loginViewModel.token ?? "";
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
      final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
      final String token = loginViewModel.token ?? "";
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
