import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/clinics_models/clinics_models.dart';
import 'package:reprohealth_app/services/clinics_services/clinics_services.dart';
import 'package:rxdart/rxdart.dart';

class ClinicsViewModel extends ChangeNotifier {
  final TextEditingController _searchKlinikAppoinmentController =
      TextEditingController();
  TextEditingController get searchKlinikAppoinmentController =>
      _searchKlinikAppoinmentController;

  final ClinicsServices _clinicsServices = ClinicsServices();
  ClinicsModels? _clinicsList;
  ClinicsModels? get clinicsList => _clinicsList;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  List<ResponseDataClinics>? _filteredClinicsList = [];
  List<ResponseDataClinics>? get filteredClinicsList => _filteredClinicsList;

  ClinicsViewModel() {
    getClinicsList();
  }

  @override
  void dispose() {
    _searchKlinikAppoinmentController.dispose();
    _searchController.close();
    super.dispose();
  }

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
}
