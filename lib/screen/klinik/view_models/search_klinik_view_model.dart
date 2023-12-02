import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';

class SearchKlinikViewModel extends ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<DokterModelsLama> _filteredDokterList = [];
  List<DokterModelsLama> get filteredDokterList => _filteredDokterList;

  List<SpesialisModels> _filteredSpesialisList = [];
  List<SpesialisModels> get filteredSpesialisList => _filteredSpesialisList;

  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  set selectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  void filterDokterList(String query) {
    _filteredDokterList = dokterKandunganData
        .where((dokter) =>
            dokter.nama.toLowerCase().contains(query.toLowerCase()) ||
            dokter.spesialis.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void filterSpesialisList(String query) {
    _filteredSpesialisList = spesialisModelsData
        .where((spesialis) =>
            spesialis.spesialis.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
