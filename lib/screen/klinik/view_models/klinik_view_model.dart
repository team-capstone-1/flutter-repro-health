import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/klinik_models.dart';

class KlinikViewModel extends ChangeNotifier {
  final TextEditingController _searchKlinikAppoinmentController =
      TextEditingController();
  TextEditingController get searchKlinikAppoinmentController =>
      _searchKlinikAppoinmentController;

  List<KlinikModels> _filteredKlinikData = [];
  List<KlinikModels> get filteredKlinikData => _filteredKlinikData;
  bool _hasSearchResults = true;
  bool get hasSearchResults => _hasSearchResults;

  void filterSearchDokter(String query) {
    List<KlinikModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = klinikModelsData
          .where((data) =>
              data.namaRumahSakit.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(klinikModelsData);
    }

    _filteredKlinikData = searchResults;
    _hasSearchResults = searchResults.isNotEmpty;

    notifyListeners();
  }
}
