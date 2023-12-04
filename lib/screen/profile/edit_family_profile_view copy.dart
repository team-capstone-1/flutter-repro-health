import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/delete_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/post_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/put_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/change_data_profile_view.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/select_drop_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/snackbar_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class EditFamilyProfile extends StatefulWidget {
  final String? idPatients;
  final String? relation;
  final String? date;
  final String? nameController;
  final String? nomorController;
  final double? beratController;
  final int? tinggiController;

  const EditFamilyProfile({super.key, this.idPatients, this.nameController, this.nomorController, this.beratController, this.tinggiController, this.relation, this.date});

  @override
  State<EditFamilyProfile> createState() => _EditFamilyProfileState();
}

class _EditFamilyProfileState extends State<EditFamilyProfile> {

  late String idPatients;
  late String relation;
  late TextEditingController nameController;
  late TextEditingController nomorController;
  late TextEditingController beratController;
  late TextEditingController tinggiController;
  late OptionItem optionItemSelected;
  late TextEditingController dateController;

  late final PutFamilyProfileViewModel updateProvider;

 @override
  void initState() {

    super.initState();
    idPatients = widget.idPatients ?? "";
    relation = widget.relation ?? "";
    dateController = TextEditingController(text: widget.date ?? "");
    nameController = TextEditingController(text: widget.nameController);
    nomorController = TextEditingController(text: widget.nomorController);
    beratController = TextEditingController(text: widget.beratController?.toString());
    tinggiController = TextEditingController(text: widget.tinggiController?.toString());
    Provider.of<GetFamilyProfileViewModel>(context, listen: false).fetchProfileDataId(context: context, idPatients: idPatients);
    optionItemSelected = OptionItem(title: relation);
  }

  @override
  void dispose() {  
    nameController.dispose();
    nomorController.dispose();
    dateController.dispose(); 
    beratController.dispose();
    tinggiController.dispose();
    super.dispose();
  }

  DropListModel dropListModel = DropListModel([
    OptionItem(title: "Anak"),
    OptionItem(title: "Pasangan"),
    OptionItem(title: "Orang Tua"),
    OptionItem(title: "Kakak"),
    OptionItem(title: "Adik"),
  ]);

  @override
  Widget build(BuildContext context) {
    final postFamilyProfile = Provider.of<PostFamilyProfileViewModel>(context);
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
          },
        ),
        titleSpacing: 0,
        title: Text("Ubah Data Keluarga Saya",
        style: semiBold16Primary4,
        ),
         actions: <Widget>[
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 212,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Profil Keluarga Dihapus?',
                            style: semiBold14Grey500,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Apakah Anda yakin akan menghapus profil ini?",
                            style: semiBold12Grey500,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ButtonWidget(
                              title: "Hapus",
                              onPressed: () async {
                                Provider.of<DeleteProfileFamilyViewModel>(context, listen: false).deleteProfileById(context, idPatients);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  CustomSnackBar(
                                    contentText: 'Profil keluarga berhasil dihapus!',
                                    backgroundColor: positive,
                                  )
                                );
                              },
                              color: negative),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ButtonWidget(
                              title: "Batal",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: green500),
                          ),
                        ],
                      ),
                    );
                  });
                },
            child: Text("Hapus",
              style: semiBold16negative
            )
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    ),
                  child: Center(
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
                        itemSelected: optionItemSelected,
                        dropListModel: dropListModel,
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
                          optionItemSelected = optionItem;
                          relation = optionItem.title;
                          setState(() {});
                          },
                        ),
                      ),
                    )
                  ),
                ),
              ChangeDataProfile(
                controller1: nameController,
                controller2: nomorController,
                controller3: beratController,
                controller4: tinggiController,
                dateController: dateController,
                ),
              ],
            ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ButtonWidget(
                  title: "Simpan",
                  onPressed: () {
                    var updateProvider = Provider.of<PutFamilyProfileViewModel>(context, listen: false);
                    String originalDate = dateController.text;
                    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(originalDate);
                    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(parsedDate.toUtc());

                    updateProvider.updateProfileData(
                      context:context, idPatients: idPatients,
                      relation: relation,
                      name: nameController.text,
                      nomor: nomorController.text,
                      date: formattedDate,
                      berat: double.parse(beratController.text),
                      tinggi: int.parse(tinggiController.text)
                      );
                    postFamilyProfile.nameController.clear();
                    postFamilyProfile.nomorController.clear();
                    postFamilyProfile.beratController.clear();
                    postFamilyProfile.tinggiController.clear();
                    postFamilyProfile.optionItemSelected = OptionItem(title: "Pilih Hubungan");
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(
                        contentText: 'Profil keluarga berhasil diubah!',
                        backgroundColor: positive,
                      )
                    );
                  },
                  color: green500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}