import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';

import 'package:reprohealth_app/services/riwayat_services/riwayat_services.dart';

class RescedhuleViewModel extends ChangeNotifier {
  bool isLoading = false;

  //^ LIST sesi rescedhule
  //! ISI LIST JANGAN DI GANTI !!!
  // list sesi rescedhule sudah sesuai dengan request body
  List<String> sessions = [
    "pagi",
    "siang",
    "malam",
  ];

  //^ SET selectionSession
  // [SESI] rescedhule yang dipilih oleh user
  String? _selectedSession;
  String? get selectedSession => _selectedSession;
  set setSelectedSession(String newSession) {
    _selectedSession = newSession;
    notifyListeners();
  }

  //^ SET selectedDate
  // [TANGGAL] rescedhule yang dipilih oleh user
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set setSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  //^ RESCEDHULE
  void rescedhule({
    required BuildContext context,
    required String? idTransactions,
  }) async {
    final services = RiwayatServices();
    // selectedDate + 1 hari untuk input ke DB
    DateTime? addSelectedDate = _selectedDate?.add(
      const Duration(days: 1),
    );

    isLoading = true; // proses loading
    notifyListeners();

    try {
      // tunda selama 4 detik sebelum route ke-> confirm status
      await Future.delayed(const Duration(seconds: 4));

      // req data
      services.putReschedule(
        idTransaction: idTransactions,
        date: addSelectedDate,
        session: _selectedSession,
      );

      _selectedDate = null;
      _selectedSession = null;

      // route ke -> halaman konfirmasi
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.confirmStatusView,
          (route) => false,
          arguments: 'Berhasil Mengubah Jadwal',
        );
      }
    } on DioException catch (e) {
      throw Exception(e.response);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isButtonValidate() {
    return _selectedDate != null && _selectedSession?.isNotEmpty == true;
  }

  //^ HARI MINGGU DALAM SATU TAHUN
  List<DateTime> getSundayHolidays(int year) {
    List<DateTime> sundays = [];

    for (int month = 1; month <= 12; month++) {
      for (int day = 1; day <= 31; day++) {
        try {
          DateTime date = DateTime(year, month, day);

          if (date.weekday == DateTime.sunday) {
            //tambahkan semua hari minggu dalam satu tahun
            sundays.add(date);
          }
        } catch (e) {
          if (kDebugMode) {
            print('Invalid Date $e');
          }
        }
      }
    }
    return sundays;
  }
}
