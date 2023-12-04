import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/dokter_models/dokter_models.dart';
import 'package:reprohealth_app/services/dokter_services/dokter_services.dart';
import 'package:rxdart/rxdart.dart';

class DetailSpesialisViewModel extends ChangeNotifier {
  final DokterServices _dokterServices = DokterServices();

  DokterModels? _dokterList;
  DokterModels? get dokterList => _dokterList;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  final TextEditingController _searchDokterController =
      TextEditingController();
  TextEditingController get searchDokterController =>
      _searchDokterController;

  List<ResponseDataDokter> _filteredDokterData = [];
  List<ResponseDataDokter> get filteredDokterData =>
      _filteredDokterData;

  DetailSpesialisViewModel() {
    getDokterList();
  }

  void filterSearchDokter(String query) {
    List<ResponseDataDokter> searchResults = [];
    if (query.isNotEmpty) {
      searchResults = dokterList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResults.addAll(dokterList?.response ?? []);
    }
    _filteredDokterData = searchResults;
    _searchController.add(query);
    notifyListeners();
  }

  @override
  void dispose() {
    _searchController.close();
    super.dispose();
  }

  Future<void> getDokterList() async {
    try {
      _dokterList = await _dokterServices.getListDokter();
      _filteredDokterData = _dokterList?.response ?? [];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
