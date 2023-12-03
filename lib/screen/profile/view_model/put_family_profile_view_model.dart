import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class PutFamilyProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  String? relation;
  String? date;
  String? name;
  String? nomor;
  double? berat;
  int? tinggi;
  String? gender;

  Future<void> updateProfileData({
    String? relation,
    String? date,
    String? name,
    String? nomor,
    double? berat,
    int? tinggi,
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
        'gender': gender
      });

    try {
      await _profileService.putProfileModel(
        context: context,
        formData: formData,
        idPatients: idPatients
      );
      notifyListeners();
      print("sukses Update data");
    } catch (e) {
      print('Error: $e');

    }
  }
  
}

