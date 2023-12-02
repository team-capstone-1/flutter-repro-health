import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/maps_models.dart';

class MapsViewModel extends ChangeNotifier {
  final TextEditingController _searchMapsController = TextEditingController();
  TextEditingController get searchMapsController => _searchMapsController;

  List<MapsModels> _filteredMapsData = [];
  List<MapsModels> get filteredMapsData => _filteredMapsData;

  void filterSearchMaps(String query) {
    List<MapsModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = mapsData
          .where((data) =>
              data.namaStasiun.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(mapsData);
    }

    _filteredMapsData = searchResults;
    notifyListeners();
  }
}
