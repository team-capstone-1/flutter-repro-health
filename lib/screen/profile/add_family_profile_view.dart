import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/change_gender_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/post_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/change_data_profile_view.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/select_drop_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/snackbar_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AddFamilyProfile extends StatefulWidget {
  const AddFamilyProfile({super.key});

  @override
  State<AddFamilyProfile> createState() => _AddFamilyProfileState();
}

class _AddFamilyProfileState extends State<AddFamilyProfile> {

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final datePickerProvider = Provider.of<DatePickerViewModel>(context, listen: false);
    dateController.text = DateFormat('dd/MM/yyyy').format(datePickerProvider.dueDate);
    
  }

  @override
  Widget build(BuildContext context) {
    final postFamilyProfile = Provider.of<PostFamilyProfileViewModel>(context);
    final datePickerProvider = Provider.of<DatePickerViewModel>(context);
    final changeGenderViewModel = Provider.of<ChangeGenderViewModel>(context);
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
            changeGenderViewModel.groupValue.value = "";
          },
        ),
        titleSpacing: 0,
        title: Text("Tambah Data Keluarga Saya",
        style: semiBold16Primary4,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8,),
                        child: SelectDropList(
                          space: 16,
                          borderColor: grey200,
                          dropboxborderColor: grey500,
                          dropbBoxborderRadius: BorderRadius.circular(4),
                          borderRadius: BorderRadius.circular(4),
                          paddingLeft: 0,
                          paddingRight: 0,
                          paddingBottom: 0,
                          itemSelected: postFamilyProfile.optionItemSelected,
                          dropListModel: postFamilyProfile.dropListModel,
                          showIcon: false,
                          showArrowIcon: true,
                          showBorder: true,
                          heightBottomContainer: 166,
                          paddingTop: 0,
                          paddingDropItem: const EdgeInsets.only(left: 16, bottom: 16),
                          suffixIcon: Icons.keyboard_arrow_down,
                          containerPadding: const EdgeInsets.only(right: 16,),
                          icon: const Icon(Icons.person, color: Colors.black),
                          onOptionSelected: (optionItem) {
                            postFamilyProfile.optionItemSelected = optionItem;
                            setState(() {});
                            },
                          ),
                        )
                      ),
                    ),
                  ChangeDataProfile(
                    controller1: postFamilyProfile.nameController,
                    controller2: postFamilyProfile.nomorController,
                    controller3: postFamilyProfile.beratController,
                    controller4: postFamilyProfile.tinggiController,
                    dateController: dateController,
                    onChanged: (String? value) {
                      changeGenderViewModel.groupValue.value = value ?? "";
                      Provider.of<PostFamilyProfileViewModel>(context, listen: false).gender = changeGenderViewModel.groupValue.value;
                    },
                    ),
                  ],
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ButtonWidget(
                    title: "Simpan",
                    onPressed: () {
                      var familyProfileNotifier = Provider.of<PostFamilyProfileViewModel>(context, listen: false);
                        if (_formKey.currentState!.validate()) {
                          familyProfileNotifier.saveProfileData(context);
                          postFamilyProfile.nameController.clear();
                          postFamilyProfile.nomorController.clear();
                          postFamilyProfile.beratController.clear();
                          postFamilyProfile.tinggiController.clear();
                          changeGenderViewModel.groupValue.value = "";
                          postFamilyProfile.optionItemSelected = OptionItem(title: "Pilih Hubungan");
                          datePickerProvider.dueDate =DateTime.now();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              contentText: 'Profil keluarga berhasil dibuat!',
                              backgroundColor: positive,
                            )
                          );
                        }
                    },
                    color: green500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}