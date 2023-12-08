import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/appointment_status.dart';

import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/services/riwayat_services/riwayat_services.dart';

class RiwayatViewModel extends ChangeNotifier {
  String nullImage =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

  //^ SERVICES
  final services = RiwayatServices();

  //^ MODEL
  HistoryTransactionModel? model;

  bool isLoading = false; // isLoading

  //^ GET TRANSACTIONS
  Future<void> getTransaction({
    required String patientId,
  }) async {
    isLoading = true; // loading state
    notifyListeners();

    // request
    try {
      // utnda selama 4 detik sebelum melakukan request
      await Future.delayed(const Duration(seconds: 5));

      model = await services.getTransaction(
        idPatients: patientId,
      );

      isLoading = false; // unLoading state
      notifyListeners();
    } on DioException catch (e) {
      isLoading = false; // unLoading state
      notifyListeners();

      throw Exception("Failed to get data : ${e.response}");
    }
  }

  //^ GET TRANSACTION BY STATUSES
  List<ResponseData> getTransactionsByStatus({required List<String> statuses}) {
    if (model != null && model!.response != null) {
      isLoading = true; // loading state
      notifyListeners();

      return model!.response!
          .where((transaction) => statuses.contains(transaction.status))
          .toList();
    } else {
      isLoading = false; // unLoading state
      notifyListeners();

      return [];
    }
  }

  //^ GET PROCESSED TRANSACTIONS - Tabbar Diproses
  List<ResponseData> getProcessedTransactions() {
    return getTransactionsByStatus(statuses: [
      AppointmentStatus.menunggu,
      AppointmentStatus.proses,
    ]);
  }

  //^ GET SUCESSED TRANSACTIONS - Tabbar Selesai
  List<ResponseData> getSuceesedTransactions() {
    return getTransactionsByStatus(statuses: [AppointmentStatus.selesai]);
  }

  //^ GET CANCELLED TRANSACTIONS - Tabbar Batal
  List<ResponseData> getCancelledTransactions() {
    return getTransactionsByStatus(statuses: [AppointmentStatus.batal]);
  }

  //^ Convert IDR
  String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
