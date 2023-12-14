import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/clinics_models/clinics_models.dart';
import 'package:reprohealth_app/models/specialist_models/specialist_models.dart';
import 'package:reprohealth_app/services/clinics_services/clinics_services.dart';
import 'package:reprohealth_app/services/specialist_services/specialist_services.dart';
import 'package:rxdart/rxdart.dart';

class AppoinmentViewModel extends ChangeNotifier {
  final TextEditingController _searchAppoinmentController =
      TextEditingController();
  TextEditingController get searchAppoinmentController =>
      _searchAppoinmentController;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  AppoinmentViewModel() {
    getClinicsList();
    getSpecialistList();
  }

  /// CLINICS
  final ClinicsServices _clinicsServices = ClinicsServices();
  ClinicsModels? _clinicsList;
  ClinicsModels? get clinicsList => _clinicsList;

  List<ResponseDataClinics> _filteredClinicsList = [];
  List<ResponseDataClinics> get filteredClinicsList => _filteredClinicsList;

  Future<void> getClinicsList() async {
    try {
      _clinicsList = await _clinicsServices.getListClinics();
      _filteredClinicsList = _clinicsList?.response ?? [];
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// SPECIALIST
  final SpecialistServices _specialistServices = SpecialistServices();
  SpecialistModels? _specialistList;
  SpecialistModels? get specialistList => _specialistList;

  List<ResponseDataSpecialist> _filteredspecialist = [];
  List<ResponseDataSpecialist> get filteredspecialist => _filteredspecialist;

  Future<void> getSpecialistList() async {
    try {
      _specialistList = await _specialistServices.getListSpecialist();
      _filteredspecialist = _specialistList?.response ?? [];
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// SEARCH CLINICS
  void filterSearchClinics(String query) {
    List<ResponseDataClinics> searchResults = [];
    if (query.isNotEmpty) {
      searchResults = clinicsList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResults.addAll(clinicsList?.response ?? []);
    }
    _filteredClinicsList = searchResults;
    _searchController.add(query);
    notifyListeners();
  }

  /// SEARCH SPECIALIST
  void filterSearchSpecialist(String query) {
    List<ResponseDataSpecialist> searchResults = [];
    if (query.isNotEmpty) {
      searchResults = specialistList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResults.addAll(specialistList?.response ?? []);
    }
    _filteredspecialist = searchResults;
    _searchController.add(query);
    notifyListeners();
  }
}
