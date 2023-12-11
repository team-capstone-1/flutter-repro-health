import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
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

  void saveId(String idConsultasion) {
    _id = idConsultasion;
    notifyListeners();
  }

  Future<void> getTransactions({required String patientId}) async {
    try {
      _appointmentList =
          await _appointmentServices.getTransactions(patientId: patientId);
      notifyListeners();
    } catch (e) {
      print(e);
    } 
  }

  Future<void> getProfile({required BuildContext context}) async {
    try {
      _profileList = await _profileServices.getProfileModel(context: context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> postConsultasion(
      {required String patientId,
      required String doctorId,
      required DateTime date,
      required String session,
      required BuildContext context,
      required ResponseDataProfile? dataProfile}) async {
    try {
      final id = await AppointmentServices().postConsultasion(
        patientId: patientId,
        doctorId: doctorId,
        date: date,
        session: session,
        context: context,
      );
      if (context.mounted) {
        if (id.isNotEmpty == true) {
          Navigator.pushNamed(
            context,
            RoutesNavigation.janjiTemuView,
            arguments: ArgumentDoctor(
              id: id,
              dataProfile: dataProfile ?? ResponseDataProfile(),
            ),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

class ArgumentDoctor {
  final String id;
  final ResponseDataProfile dataProfile;

  ArgumentDoctor({
    required this.id,
    required this.dataProfile,
  });
}
