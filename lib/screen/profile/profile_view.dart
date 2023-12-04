import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/view_model/file_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<GetFamilyProfileViewModel>(context, listen: false).fetchProfileData(context: context);
    return Scaffold(
        backgroundColor: const Color(0xffE9E9E9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('Profil', style: semiBold16Grey500),
        ),
        body: Consumer<FilePickerViewModel>(
          builder: (context, filePickerProvider, child) {
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 92,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xFFB9B9B9),
                              backgroundImage:
                                  filePickerProvider.result != null &&
                                          filePickerProvider
                                              .result!.paths.isNotEmpty
                                      ? Image.file(File(filePickerProvider
                                              .result!.paths[0]
                                              .toString()))
                                          .image
                                      : null,
                            ),
                          ),
                          Consumer<GetFamilyProfileViewModel>(
                            builder: (context, getFamilyProfileViewModel, child) {
                              final myProfile =  getFamilyProfileViewModel.profileList?.response?.first;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      myProfile?.name?? "-",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF1E1E1E),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      myProfile?.telephoneNumber?? "-",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF1E1E1E),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ProfilMenuWidget(
                  title: "Akun",
                  textStyle: semiBold12Black600,
                ),
                const SizedBox(
                  height: 1,
                ),
                ProfilMenuWidget(
                    title: "Profil Saya",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.myProfile)),
                ProfilMenuWidget(
                    title: "Keluarga Saya",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.familyProfile)),
                ProfilMenuWidget(
                    title: "Ubah Kata Sandi",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.changePasswordView)),
                const SizedBox(
                  height: 16,
                ),
                ProfilMenuWidget(
                  title: "Aplikasi ReproHealth",
                  textStyle: semiBold14Black,
                ),
                const SizedBox(
                  height: 1,
                ),
                ProfilMenuWidget(
                    title: "Tentang Kami",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesNavigation.aboutUs)),
                ProfilMenuWidget(
                    title: "Pusat Bantuan",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.pusatBantuanView)),
                ProfilMenuWidget(
                    title: "Ketentuan Pengguna",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.ketentuanPenggunaView)),
                ProfilMenuWidget(
                    title: "Kebijakan Privasi",
                    textStyle: semiBold12Black500,
                    icon: Icons.keyboard_arrow_right,
                    onTap: () => Navigator.pushNamed(
                        context, RoutesNavigation.kebijakanPrivasiView)),
                const SizedBox(
                  height: 16,
                ),
                ProfilMenuWidget(
                  title: "Keluar",
                  textStyle: semiBold12Black500,
                  icon: Icons.logout,
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 212,
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  'Keluar dari Akun ReproHealth? ',
                                  style: semiBold14Grey500,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Jika kamu ingin menggunakan layanan ReproHealth, \nkamu perlu masuk ke akunmu kembali. ",
                                  style: regular12Grey500,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ButtonWidget(
                                      title: "Ya, Keluar",
                                      onPressed: () async {
                                        await SharedPreferencesUtils()
                                            .removeToken();
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RoutesNavigation.loginView,
                                          (route) => false,
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
                ),
              ],
            );
          },
        ));
  }
}
