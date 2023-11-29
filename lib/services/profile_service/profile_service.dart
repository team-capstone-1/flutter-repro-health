import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_token_view_model.dart';

class ProfileService {
  final String apiUrl = 'https://dev.reprohealth.my.id/patients';
  final GetTokenViewModel _getTokenViewModel;

  ProfileService(this._getTokenViewModel);

  Future<ProfileModel> getProfileModel() async {
    try {
      final response = await Dio().get(
        apiUrl,
        options: Options(
          headers: {'Authorization': 'Bearer ${_getTokenViewModel.token}'},
        ),
      );
      print(response.data);
      return ProfileModel.fromMap(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }
}

