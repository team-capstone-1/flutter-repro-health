import 'package:flutter/material.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class DeleteProfileFamilyViewModel extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  Future<void> deleteProfileById(BuildContext context, String idPatients) async {
    try {
      await _profileService.deleteProfileModelId(context: context, idPatients: idPatients);
      notifyListeners();
    } catch (e) {
      e;
      rethrow;
    }
  }
}
