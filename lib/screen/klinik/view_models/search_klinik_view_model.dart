import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/dokter_models/dokter_models.dart';
import 'package:reprohealth_app/models/specialist_models/specialist_models.dart';
import 'package:reprohealth_app/services/dokter_services/dokter_services.dart';
import 'package:reprohealth_app/services/specialist_services/specialist_services.dart';
import 'package:rxdart/rxdart.dart';

class SearchKlinikViewModel extends ChangeNotifier {
  final TextEditingController _searchClinicsController = TextEditingController();
  TextEditingController get searchClinicsController => _searchClinicsController;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  // DOCTOR
  final DokterServices _dokterServices = DokterServices();
  DokterModels? _dokterList;
  DokterModels? get dokterList => _dokterList;
  
  List<ResponseDataDokter> _filteredDokter = [];
  List<ResponseDataDokter> get filteredDokter =>
      _filteredDokter;

  Future<void> getListDokterClinics({required String clinicsId}) async {
    try {
      _dokterList = await _dokterServices.getDokterByClinics(clinicsId: clinicsId);
      _filteredDokter = _dokterList?.response ?? [];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void filterSearchDokter(String query) {
    List<ResponseDataDokter> searchResultsDokter = [];
    if (query.isNotEmpty) {
      searchResultsDokter = dokterList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResultsDokter.addAll(dokterList?.response ?? []);
    }
    _filteredDokter = searchResultsDokter;
    _searchController.add(query);
    notifyListeners();
  }

  // SPECIALIST
  final SpecialistServices _specialistServices = SpecialistServices();
  SpecialistModels? _specialistList;
  SpecialistModels? get specialistList => _specialistList;
  
  List<ResponseDataSpecialist> _filteredSpecialist = [];
  List<ResponseDataSpecialist> get filteredSpecialist =>
      _filteredSpecialist;

  Future<void> getListSpecialistClinics({required String clinicsId}) async {
    try {
      _specialistList = await _specialistServices.getListSpecialistClinics(clinicsId: clinicsId);
      _filteredSpecialist = _specialistList?.response ?? [];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void filterSearchSpecialist(String query) {
    List<ResponseDataSpecialist> searchResultsSpecialist = [];
    if (query.isNotEmpty) {
      searchResultsSpecialist = specialistList?.response
              ?.where((data) =>
                  data.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false)
              .toList() ??
          [];
    } else {
      searchResultsSpecialist.addAll(specialistList?.response ?? []);
    }
    _filteredSpecialist = searchResultsSpecialist;
    _searchController.add(query);
    notifyListeners();
  }


  // TAB
  int _selectIndex = 0;
  int get selectIndex => _selectIndex;
  set selectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
