import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/models/specialist_models/specialist_models.dart';
import 'package:reprohealth_app/services/doctor_services/doctor_services.dart';
import 'package:reprohealth_app/services/specialist_services/specialist_services.dart';
import 'package:rxdart/rxdart.dart';

class SearchKlinikViewModel extends ChangeNotifier {
  final TextEditingController _searchClinicsController =
      TextEditingController();
  TextEditingController get searchClinicsController => _searchClinicsController;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  // DOCTOR
  final DokterServices _dokterServices = DokterServices();
  DoctorModels? _dokterList;
  DoctorModels? get dokterList => _dokterList;

  List<ResponseDataDoctor> _filteredDokter = [];
  List<ResponseDataDoctor> get filteredDokter => _filteredDokter;

  Future<void> getListDokterClinics({required String clinicsId}) async {
    try {
      _dokterList =
          await _dokterServices.getDokterByClinics(clinicsId: clinicsId);
      filterSearchDokter(_searchController.value); // Ensure initial filtering
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void filterSearchDokter(String query) {
    if (kDebugMode) {
      print('Search Query Dokter: $query');
    }
    _filteredDokter = _dokterList?.response
            ?.where((data) =>
                data.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList() ??
        [];
    if (kDebugMode) {
      print('Filtered Dokter: $_filteredDokter');
    }
    _searchController.add(query);
    notifyListeners();
  }

  // SPECIALIST
  final SpecialistServices _specialistServices = SpecialistServices();
  SpecialistModels? _specialistList;
  SpecialistModels? get specialistList => _specialistList;

  List<ResponseDataSpecialist> _filteredSpecialist = [];
  List<ResponseDataSpecialist> get filteredSpecialist => _filteredSpecialist;

  Future<void> getListSpecialistClinics({required String clinicsId}) async {
    try {
      _specialistList = await _specialistServices.getListSpecialistClinics(
          clinicsId: clinicsId);
      filterSearchSpecialist(
          _searchController.value); // Ensure initial filtering
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void filterSearchSpecialist(String query) {
    if (kDebugMode) {
      print('Search Query Specialist: $query');
    }
    _filteredSpecialist = _specialistList?.response
            ?.where((data) =>
                data.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
            .toList() ??
        [];
    if (kDebugMode) {
      print('Filtered Specialist: $_filteredSpecialist');
    }
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
