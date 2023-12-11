import 'package:flutter/material.dart';

import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/services/riwayat_services/riwayat_services.dart';

class RefundViewModel extends ChangeNotifier {
  bool isLoading = false;

  final List<String> _bankLists = [
    "BCA",
    "Mandiri",
    "BRI",
    "BNI",
    "Bank Syariah",
    "Bank Mega",
    "Danamon",
    "Maybank",
    "Mestika",
  ];
  List<String> get bankLists => _bankLists;

  String? _selectedBank;
  set setSelectedBank(String? newBank) {
    _selectedBank = newBank;
    notifyListeners();
  }

  String? get selectedBank => _selectedBank;
  String _nameValue = '';
  String? get nameValue => _nameValue;
  String _accountValue = '';
  String? get accountValue => _accountValue;
  String _nameErrorText = '';
  String? get nameErrorText => _nameErrorText;
  String _accountErrorText = '';
  String? get accountErrorText => _accountErrorText;

  bool isButtonEnabled() {
    return _nameValue.isNotEmpty &&
        _accountValue.isNotEmpty &&
        _nameErrorText.isEmpty &&
        _accountErrorText.isEmpty &&
        _selectedBank != null;
  }

  void nameOnchanged(String value) {
    _nameValue = value;
    if (_nameValue.isEmpty) {
      _nameErrorText = 'Nama tidak boleh kosong';
    } else if (RegExp(r'[0-9]').hasMatch(_nameValue)) {
      _nameErrorText = 'Nama tidak boleh mengandung angka';
    } else if (!RegExp(r'^[A-Z]').hasMatch(_nameValue.substring(0, 1))) {
      _nameErrorText = 'Nama harus dimulai dengan huruf kapital';
    } else if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(_nameValue)) {
      _nameErrorText = 'Nama tidak boleh mengandung karakter khusus';
    } else {
      _nameErrorText = '';
    }
    notifyListeners();
  }

  void accountOnchanged(String value) {
    _accountValue = value;
    if (_accountValue.isEmpty) {
      _accountErrorText = 'Rekening tidak boleh kosong';
    } else if (!RegExp(r'^[0-9]*$').hasMatch(_accountValue)) {
      _accountErrorText =
          'Rekening tidak boleh mengandung huruf atau karakter khusus';
    } else {
      _accountErrorText = '';
    }
    notifyListeners();
  }

  //^ refund
  Future<void> refund({
    required BuildContext context,
    required ResponseData? appointmentData,
  }) async {
    final services = RiwayatServices();
    isLoading = true; // loading State
    notifyListeners();

    // proses
    try {
      // tunda proses selama 2 detik
      await Future.delayed(const Duration(seconds: 2));

      await services.postRefundTransaction(
        idTransactions: appointmentData?.id,
        userName: _nameValue,
        bankName: _selectedBank,
        accountNumber: _accountValue,
      );

      // navigasi ke-> halaman detail refund
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNavigation.refundDetailsView,
          (route) => route.isFirst,
          arguments: appointmentData,
        );
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading = false; // unLoadind state
      notifyListeners();
    }
  }
}
