import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/dokter_models/dokter_models.dart';

class DokterServices {
  Future<DokterModels> getListDokter() async {
    const String apiGetDokter = "https://dev.reprohealth.my.id/doctors";
    try {
      var response = await Dio().get(apiGetDokter);
      return DokterModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<DokterModels> getDokterByClinics({required String clinicsId}) async {
    String apiGetDokterByClinics = "https://dev.reprohealth.my.id/clinics/$clinicsId/doctors";
    try {
      var response = await Dio().get(apiGetDokterByClinics);
      return DokterModels.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }
}
