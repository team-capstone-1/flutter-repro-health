import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/appointment_services/appointment_services.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class JanjiTemuViewModel extends ChangeNotifier {
  final AppointmentServices _appointmentServices = AppointmentServices();
  AppoinmentModels? _appointmentList;
  AppoinmentModels? get appointmentList => _appointmentList;

  final ProfileService _profileServices = ProfileService();
  ProfileModel? _profileList;
  ProfileModel? get profileList => _profileList;

  String? _id;
  String? get id => _id;

  List<String> listPaymentMethod = [
    "clinic_payment",
    "manual_transfer",
  ];

  String _selectedPayment = '';
  String get selectedPayment => _selectedPayment;
  set setSelectedPayment(String newPayment) {
    _selectedPayment = newPayment;
    notifyListeners();
  }

  void saveId(String idConsultasion) {
    _id = idConsultasion;
    notifyListeners();
  }

  // PILIH SESI
  List<String> sessions = [
    "pagi",
    "siang",
    "malam",
  ];

  //^ SET selectionSession
  // [SESI] rescedhule yang dipilih oleh user
  String _selectedSession = '';
  String get selectedSession => _selectedSession;
  set setSelectedSession(String newSession) {
    notifyListeners();
    _selectedSession = newSession;
  }


  // PILIH TANGGAL
  DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;
  DateTime _dueDate = DateTime.now();
  DateTime get dueDate => _dueDate;

  set dueDate(DateTime value) {
    _dueDate = value;
    notifyListeners();
  }

  set currentDate(DateTime value) {
    _currentDate = value;
    notifyListeners();
  }

  Future<void> getTransactions({required String patientId}) async {
    try {
      _appointmentList =
          await _appointmentServices.getTransactions(patientId: patientId);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getProfile({required BuildContext context}) async {
    try {
      _profileList = await _profileServices.getProfileModel(context: context);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> postConsultasion({
    required String patientId,
    required String doctorId,
    required DateTime date,
    required String session,
    required BuildContext context,
  }) async {
    try {
      final id = await AppointmentServices().postConsultasion(
        paymentMethod: _selectedPayment,
        patientId: patientId,
        doctorId: doctorId,
        date: date,
        session: session,
        context: context,
      );

      if (context.mounted) {
        if (id.isNotEmpty == true) {
          if (_selectedPayment == "clinic_payment") {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesNavigation.homeView,
              (route) => route.isFirst,
            );
          } else {
            Navigator.pushNamed(
              context,
              RoutesNavigation.paymentMethodView,
              arguments: id,
            );
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class ArgumentDoctor {
  final ResponseDataDoctor? dataDoctor;
  final ResponseDataProfile? dataProfile;

  ArgumentDoctor({
    required this.dataDoctor,
    required this.dataProfile,
  });
}
