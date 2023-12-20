import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class PutFamilyProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  String? relation;
  String? date;
  String? name;
  String? nomor;
  num? berat;
  num? tinggi;
  String? gender;
  MultipartFile? profileImage;

  Future<void> updateProfileData({
    String? relation,
    String? date,
    String? name,
    String? nomor,
    num? berat,
    num? tinggi,
    String? gender,
    required BuildContext context,
    required idPatients}) async {

      this.relation = relation;
      this.date = date;
      this.name = name;
      this.nomor = nomor;
      this.berat = berat;
      this.tinggi = tinggi;
      this.gender = gender;

      FormData formData = FormData.fromMap({
        'name': name,
        'telephone_number': nomor,
        'date_of_birth': date,
        'relation': relation,
        'weight': berat,
        'height': tinggi,
        'gender': gender,
      });

      

    try {
      await _profileService.putProfileModel(
        formData: formData,
        idPatients: idPatients
      );
      notifyListeners();
    } catch (e) {
      e;
    }
  }


  Future<void> updateProfileImage({
  XFile? imageFile,
  required String idPatients,
}) async {
  if (imageFile != null) {
    
    MultipartFile profileImage = await MultipartFile.fromFile(imageFile.path);

    FormData formData = FormData.fromMap({
      'profile_image': profileImage,
      
    });
    notifyListeners();

    try {
        _profileService.putProfileModel(
        formData: formData,
        idPatients: idPatients,
      );
      notifyListeners();
    } catch (e) {
      e;
    }
  }
}


  
}

