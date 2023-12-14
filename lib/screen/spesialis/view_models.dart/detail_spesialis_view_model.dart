import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/services/doctor_services/doctor_services.dart';
import 'package:rxdart/rxdart.dart';

class DetailSpesialisViewModel extends ChangeNotifier {
  final DokterServices _dokterServices = DokterServices();

  DoctorModels? _dokterBySpecialistList;
  DoctorModels? get dokterBySpecialistList => _dokterBySpecialistList;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  final TextEditingController _searchDokterController =
      TextEditingController();
  TextEditingController get searchDokterController =>
      _searchDokterController;

  List<ResponseDataDoctor> _filteredDokterBySpecialist = [];
  List<ResponseDataDoctor> get filteredDokterBySpecialist =>
      _filteredDokterBySpecialist;

  // DetailSpesialisViewModel() {
  //   getDokterList();
  // }

  void filterSearchDokter(String query) {
    List<ResponseDataDoctor> searchResults = [];
    if (query.isNotEmpty) {
      searchResults = dokterBySpecialistList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResults.addAll(dokterBySpecialistList?.response ?? []);
    }
    _filteredDokterBySpecialist = searchResults;
    _searchController.add(query);
    notifyListeners();
  }

  @override
  void dispose() {
    _searchController.close();
    super.dispose();
  }

  Future<void> getDokterBySpecialist({required String specialistId}) async {
    try {
      _dokterBySpecialistList = await _dokterServices.getDokterBySpecialist(specialistId: specialistId);
      _filteredDokterBySpecialist = _dokterBySpecialistList?.response ?? [];
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
