import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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

  List<Placemark>? _location;
  List<Placemark>? get location => _location;

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

  // Location
  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return {
        "message": "Tidak dapat mengambil lokasi pada device ini",
        "error": true,
      };
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        return {
          "message": "Izin lokasi ditolak!",
          "error": true,
        };
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      return {
        "message":
            "Kami membutuhkan lokasi untuk menampilkan rekomendasi klinik di sekitar kamu ",
        "error": true,
      };
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position currentPosition = await Geolocator.getCurrentPosition();
    return {
      "position": currentPosition,
      "message": "Berhasil mendapatkan posisi device",
      "error": false,
    };
  }

  Future<void> getLocation() async {
    Map<String, dynamic> responseData = await determinePosition();

    if (responseData['error'] != true) {
      //^ KONVERSI TITIK KOORDINAT KE BENTUK ALAMAT
      Position position = responseData['position'];
      _location = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
    } else {
      if (kDebugMode) {
        print('Gagal mendapatkan lokasi');
      }
    }
    if (kDebugMode) {
      print('Location ${_location?.first.street}');
    }
  }
}
