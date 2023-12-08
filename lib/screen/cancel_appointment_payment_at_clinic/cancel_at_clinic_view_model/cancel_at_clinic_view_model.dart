import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/riwayat_services/riwayat_services.dart';

class CancelAtClinicViewModel extends ChangeNotifier {
  bool isLoading = false;

  // cancel transactions
  Future<void> cancelTransaction({
    required String? idTransactions,
    required BuildContext context,
  }) async {
    final services = RiwayatServices();
    isLoading = true; // loading state
    notifyListeners();

    // request
    try {
      // tunda selama 2 detik untuk proses
      await Future.delayed(const Duration(seconds: 2), () {
        services.postCancelTransaction(
          idTransactions: idTransactions,
        );

        isLoading = false; // unLoading state
        notifyListeners();

        // routes ke-> halaman konfirmasi status
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.confirmStatusView,
          (route) => route.isFirst,
        );
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
