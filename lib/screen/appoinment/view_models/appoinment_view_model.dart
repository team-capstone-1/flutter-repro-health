import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';

class AppoinmentViewModel extends ChangeNotifier {
  final TextEditingController _searchAppoinmentController =
      TextEditingController();
  TextEditingController get searchAppoinmentController =>
      _searchAppoinmentController;

  List<KlinikModels> _filteredDasboardKlinikData = [];
  List<KlinikModels> get filteredDasboardKlinikData =>
      _filteredDasboardKlinikData;
  List<SpesialisModels> _filteredDasboardSpesialisData = [];
  List<SpesialisModels> get filteredDasboardSpesialisData =>
      _filteredDasboardSpesialisData;

  // search Klinik
  void filterSearchKlinik(String query) {
    if (query.isNotEmpty) {
      _filteredDasboardKlinikData = klinikModelsData
          .where((data) =>
              data.namaRumahSakit.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredDasboardKlinikData.addAll(klinikModelsData);
    }
    _filteredDasboardKlinikData = filteredDasboardKlinikData;
    notifyListeners();
  }

// search Spesialis
  void filterSearchSpesialis(String query) {
    if (query.isNotEmpty) {
      _filteredDasboardSpesialisData = spesialisModelsData
          .where((data) =>
              data.spesialis.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      filteredDasboardSpesialisData.addAll(spesialisModelsData);
    }
    _filteredDasboardSpesialisData = filteredDasboardSpesialisData;
    notifyListeners();
  }
}
