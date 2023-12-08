import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
    String token = await SharedPreferencesUtils().getToken();
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    //^ make request
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (kDebugMode) {
        print(response.data['message']);
      }

      return HistoryTransactionModel.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load transaction list: $error');
    }
  }

  //^ RESCEDHULE
  Future<void> putReschedule({
    required String? idTransaction,
    required DateTime? date,
    required String? session,
  }) async {
    //url
    String url = '$baseUrl/transactions/$idTransaction/reschedule';
    //get token
    String token = await SharedPreferencesUtils().getToken();
    // Konversi DateTime ke format string ISO 8601
    String formattedDateTime = date?.toUtc().toIso8601String() ?? '';
    //data
    Map<String, dynamic> data = {
      "date": formattedDateTime,
      "session": session,
    };
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    //^ make request
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

  //^ REFUND TRANSACTION
  //* untuk transaksi bayar [TRANSFER MANUAL]
  Future<void> postRefundTransaction({
    required String? idTransactions,
    required String? userName,
    required String? bankName,
    required String? accountNumber,
  }) async {
    //url
    String url = '$baseUrl/transactions/$idTransactions/cancel';
    //get token
    String token = await SharedPreferencesUtils().getToken();
    //data
    Map<String, dynamic> data = {
      "name": userName,
      "bank": bankName,
      "account_number": accountNumber,
    };
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    // make request
    try {
      Response response = await dio.post(
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
      throw Exception('FAILED TO CANCEL TRANSACTION ${e.response}');
    }
  }

  //^ CANCEL TRANSACTION
  //* untuk transaksi bayar [DIKLINIK]
  Future<void> postCancelTransaction({
    required String? idTransactions,
  }) async {
    //url
    String url = '$baseUrl/transactions/$idTransactions/cancel';
    //get token
    String token = await SharedPreferencesUtils().getToken();
    //headers
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
    };

    // make request
    try {
      Response response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
    } on DioException catch (e) {
      throw Exception('FAILED TO CANCEL TRANSACTION ${e.response}');
    }
  }
}
