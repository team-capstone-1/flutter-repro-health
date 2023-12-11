import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/specialist_models/specialist_models.dart';
import 'package:reprohealth_app/services/specialist_services/specialist_services.dart';
import 'package:rxdart/rxdart.dart';

class SpecialistViewModels extends ChangeNotifier {
  final TextEditingController _searchSpecialistAppoinmentController =
      TextEditingController();
  TextEditingController get searchSpecialistAppoinmentController =>
      _searchSpecialistAppoinmentController;

  final SpecialistServices _specialistServices = SpecialistServices();
  SpecialistModels? _specialistList;
  SpecialistModels? get specialistList => _specialistList;

  final _searchController = BehaviorSubject<String>.seeded('');
  Stream<String> get searchStream => _searchController.stream;

  List<ResponseDataSpecialist> _filteredspecialist = [];
  List<ResponseDataSpecialist> get filteredspecialist =>
      _filteredspecialist;

  SpecialistViewModels() {
    getSpecialistList();
  }

  @override
  void dispose() {
    _searchSpecialistAppoinmentController.dispose();
    _searchController.close();
    super.dispose();
  }

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

  Future<void> getSpecialistList() async {
    try {
      _specialistList = await _specialistServices.getListSpecialist();
      _filteredspecialist = _specialistList?.response ?? [];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
