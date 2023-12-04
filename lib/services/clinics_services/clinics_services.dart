import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/clinics_models/clinics_models.dart';

class ClinicsServices {
  Future<ClinicsModels> getListClinics() async {
    const String apiGetClinics = "https://dev.reprohealth.my.id/clinics";
    try {
      var response = await Dio().get(apiGetClinics);
      return ClinicsModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }
}
