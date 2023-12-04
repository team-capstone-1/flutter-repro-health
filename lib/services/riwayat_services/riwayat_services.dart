import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class RiwayatServices {
  Dio dio = Dio();
  String baseUrl = 'https://dev.reprohealth.my.id';

  //^ GET TRANSACTION
  Future<HistoryTransactionModel> getTransaction({
    required String idPatients,
  }) async {
    //url
    String url = '$baseUrl/transactions/patients/$idPatients';
    //get token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(keyToken);
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (kDebugMode) {
        print(response.data);
      }

      return HistoryTransactionModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load transaction list: $error');
    }
  }

  //^ RESCEDHULE
  Future<void> putRescedhule({
    required String idTransaction,
    required String date,
    required String session,
  }) async {
    //url
    String url = '$baseUrl/transactions/$idTransaction';
    //get token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(keyToken);
    //data
    Map<String, dynamic> data = {
      "date": date,
      "session": session,
    };
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    try {
      Response response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
    } on DioException catch (e) {
      throw Exception('failed to update rescedhule $e');
    }
  }
}
