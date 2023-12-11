import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class AppointmentServices {
  Future<AppoinmentModels> getTransactions({required String patientId}) async {
    String apiGetTransactions =
        "https://dev.reprohealth.my.id/transactions/patients/$patientId";
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        apiGetTransactions,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      return AppoinmentModels.fromJson(response.data);
    } on DioException catch (error) {
      throw Exception('Failed to load forum list: $error');
    }
  }

  Future<String> postConsultasion({required String patientId, required String doctorId, required DateTime date, required String session, required BuildContext context}) async {
    String apiGetConsultasion = "https://dev.reprohealth.my.id/consultations";
    try {
      String token = await SharedPreferencesUtils().getToken();
      String formattedDateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(date);
      var response = await Dio().post(
        apiGetConsultasion,
        data: {
          "patient_id": patientId,
          "doctor_id": doctorId,
          "date": formattedDateTime,
          "session": session
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
        ),
      );
      final consultasionId = response.data['response']['id'];
      return consultasionId;
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}
