import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/specialist_models/specialist_models.dart';

class SpecialistServices {
  Future<SpecialistModels> getListSpecialist() async {
    const String apiGetSpecialist = "https://dev.reprohealth.my.id/specialists";
    try {
      var response = await Dio().get(apiGetSpecialist);
      return SpecialistModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<SpecialistModels> getListSpecialistClinics(
      {required String clinicsId}) async {
    String apiGetSpecialist = "https://dev.reprohealth.my.id/clinics/$clinicsId/specialists";
    try {
      var response = await Dio().get(apiGetSpecialist);
      return SpecialistModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }
}
