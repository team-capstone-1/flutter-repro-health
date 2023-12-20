import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';

class DokterServices {
  Future<DoctorModels> getListDokter() async {
    const String apiGetDokter = "https://dev.reprohealth.my.id/doctors";
    try {
      var response = await Dio().get(apiGetDokter);
      return DoctorModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<DoctorModels> getDokterByClinics({required String clinicsId}) async {
    String apiGetDokterByClinics = "https://dev.reprohealth.my.id/clinics/$clinicsId/doctors";
    try {
      var response = await Dio().get(apiGetDokterByClinics);
      return DoctorModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<DoctorModels> getDokterBySpecialist({required String specialistId}) async {
    String apiGetDokterBySpecialist = "https://dev.reprohealth.my.id/specialists/$specialistId/doctors";
    try {
      var response = await Dio().get(apiGetDokterBySpecialist);
      return DoctorModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }
}
