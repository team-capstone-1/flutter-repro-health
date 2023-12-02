import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';

class SpesialisViewModel extends ChangeNotifier {
  final TextEditingController _searchSpesialisAppoinmentController =
      TextEditingController();
  TextEditingController get searchSpesialisAppoinmentController =>
      _searchSpesialisAppoinmentController;

  final List<SpesialisModels> _filteredSpesialisData = [];
  List<SpesialisModels> get filteredSpesialisData => _filteredSpesialisData;

  bool _hasSearchResults = true;
  bool get hasSearchResults => _hasSearchResults;

  void filterSearchSpesialis(String query) {
    List<SpesialisModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = spesialisModelsData
          .where((data) =>
              data.spesialis.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(spesialisModelsData);
    }

    _filteredSpesialisData.clear();
    _filteredSpesialisData.addAll(searchResults);
    _hasSearchResults = searchResults.isNotEmpty;

    notifyListeners();
  }
}
