import 'package:dio/dio.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';

class PostFamilyProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  DropListModel dropListModel = DropListModel([
      OptionItem(title: "Anak"),
      OptionItem(title: "Pasangan"),
      OptionItem(title: "Orang Tua"),
      OptionItem(title: "Kakak"),
      OptionItem(title: "Adik"),
  ]);
  OptionItem optionItemSelected = OptionItem(title: "Pilih Hubungan");

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _nomorController = TextEditingController();
  TextEditingController get nomorController => _nomorController;

  final TextEditingController _beratController = TextEditingController();
  TextEditingController get beratController => _beratController;

  final TextEditingController _tinggiController = TextEditingController();
  TextEditingController get tinggiController => _tinggiController;

  String gender = "";

  Future<void> saveProfileData(BuildContext context) async {
  final datePickerProvider = Provider.of<DatePickerViewModel>(context, listen: false);
  double weight = double.tryParse(beratController.text) ?? 0.0;
  int height = int.tryParse(tinggiController.text) ?? 0;

    FormData formData = FormData.fromMap({
      'name': nameController.text,
      'telephone_number': nomorController.text,
      'date_of_birth': DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(datePickerProvider.dueDate.toLocal()),
      'relation': optionItemSelected.title,
      'weight': weight,
      'height': height,
      'gender': gender,
    });

    try {
      await _profileService.postProfileFormData(
        context: context,
        formData: formData,
      );
      notifyListeners();
    } catch (e) {
      e;

    }
  }
  
}


 // String imagePath = Assets.assetsDrNukeSpesialis;

  // var request = http.MultipartRequest(
  //   'POST',
  //   Uri.parse("https://dev.reprohealth.my.id/patients"),
  // );
  // request.headers['Content-Type'] = 'multipart/form-data';

  // request.files.add(
  //   await http.MultipartFile.fromPath(
  //     'profileImage',
  //     imagePath,
  //   ),
  // );

  // try {
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     print('Sukses mengunggah gambar');
  //   } else {
  //     print('Error: ${response.reasonPhrase}');
  //   }
  // } catch (e) {
  //   print('Error: $e');
  // }