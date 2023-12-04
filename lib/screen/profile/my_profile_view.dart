import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/view_model/file_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/bottom_sheet_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<GetFamilyProfileViewModel>(context, listen: false).fetchProfileData(context: context);
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
            onPressed: () => Navigator.pushNamed(
              context, RoutesNavigation.changeProfileView),
            child: Text("Ubah",
              style: semiBold16Green500
            )
          )
        ],
      ),
      body: Consumer<GetFamilyProfileViewModel>(
        builder: (context, getFamilyProfileViewModel, child) {
          final myProfile =  getFamilyProfileViewModel.profileList?.response?.last;
          print(myProfile?.name);
          return Padding(
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
                                      backgroundImage:
                                        filePickerProvider.result != null && filePickerProvider
                                        .result!.paths.isNotEmpty
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
                                              color: green500,
                                              size: 14,
                                            )
                                          ),
                                      )
                                    )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myProfile?.name ?? "-",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF1E1E1E),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      myProfile?.telephoneNumber ?? "-",
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
                              myProfile?.dateOfBirth == DateTime.now()? "-" :
                              DateFormat('dd MMMM yyyy').format(myProfile?.dateOfBirth?? DateTime.now()),
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
                              myProfile?.gender ?? "-",
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
                              myProfile?.weight.toString() ?? "-",
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
                              myProfile?.height.toString() ?? "-",
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
          );
        },
      ),
    );
  }
}
