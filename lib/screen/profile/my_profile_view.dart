import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/view_model/file_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_token_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/bottom_sheet_widget.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late ProfileService _profileService;

  @override
  void initState() {
    super.initState();
    _profileService =
        ProfileService(Provider.of<GetTokenViewModel>(context, listen: false));
    Provider.of<GetFamilyProfileViewModel>(context, listen: false)
        .fetchProfileData(_profileService);
  }

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<GetFamilyProfileViewModel>(context);
    return Scaffold(
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
        title: Text(
          "Profil Saya",
          style: semiBold16Primary4,
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pushReplacementNamed(
                  context, RoutesNavigation.changeProfileView),
              child: Text("Ubah",
                  style: GoogleFonts.poppins(
                    color: green550,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Consumer<FilePickerViewModel>(
          builder: (context, filePickerProvider, _) {
            return Column(
              children: [
                Container(
                  height: 92,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFB9B9B9),
                                  backgroundImage: filePickerProvider.result != null &&
                                    filePickerProvider.result!.paths.isNotEmpty
                                    ? Image.file(File(filePickerProvider.result!.paths[0].toString())).image
                                    : null,
                                ),
                              ),
                              Positioned(
                                  left: 55,
                                  top: 50,
                                  child: Container(
                                    width: 25,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFE8F9F6),
                                    ),
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          BottomSheetWidget.bottomSheet(
                                              context);
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: green550,
                                          size: 14,
                                        )),
                                  ))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  profileProvider
                                          .profileModel.response.isNotEmpty
                                      ? profileProvider
                                          .profileModel.response.first.name
                                      : '-',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF1E1E1E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                  profileProvider
                                          .profileModel.response.isNotEmpty
                                      ? profileProvider.profileModel.response
                                          .first.telephoneNumber
                                      : '-',
                                  style: regular14Grey200),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  width: double.infinity,
                  height: 224,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal Lahir",
                          style: regular12Grey200,
                        ),
                        Text(
                          profileProvider.profileModel.response.isNotEmpty
                              ? DateFormat('dd MMMM yyyy').format(profileProvider
                                  .profileModel.response.first.dateOfBirth)
                              : '-',
                          style: semiBold14Grey500,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Jenis Kelamin",
                          style: regular12Grey200,
                        ),
                        Text(
                          "Laki - laki",
                          style: semiBold14Grey500,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Berat (kg)",
                          style: regular12Grey200,
                        ),
                        Text(
                          profileProvider.profileModel.response.isNotEmpty
                              ? profileProvider
                                  .profileModel.response.first.weight
                                  .toString()
                              : '-',
                          style: semiBold14Grey500,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Tinggi (cm)",
                          style: regular12Grey200,
                        ),
                        Text(
                          profileProvider.profileModel.response.isNotEmpty
                              ? profileProvider
                                  .profileModel.response.first.height
                                  .toString()
                              : '-',
                          style: semiBold14Grey500,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
