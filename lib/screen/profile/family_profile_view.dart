import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/add_family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_token_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';
import 'package:reprohealth_app/theme/theme.dart';

class FamilyProfile extends StatefulWidget {
  const FamilyProfile({super.key});

  @override
  State<FamilyProfile> createState() => _FamilyProfileState();
}

class _FamilyProfileState extends State<FamilyProfile> {
  late ProfileService _profileService;

  @override
  void initState() {
    super.initState();
      _profileService = ProfileService(
        Provider.of<GetTokenViewModel>(context, listen: false));
        Provider.of<GetFamilyProfileViewModel>(context, listen: false)
        .fetchProfileData(_profileService);
  }


  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<GetFamilyProfileViewModel>(context);
    return Scaffold(
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
          "Profil Keluarga Saya",
          style: semiBold16Primary4,
        ),
      ),
      body: profileProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : profileProvider.profileModel.response.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Ada Profil Anggota Keluarga",
                      style: semiBold16Grey500,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Simpan profil anggota keluarga Anda di sini agar\n'
                      'dapat membuat janji bersama dokter \ndengan lebih mudah',
                      textAlign: TextAlign.center,
                      style: regular14Grey500,
                    ),
                    const SizedBox(height: 21),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ButtonWidget(
                        title: "Tambah Profil",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AddFamilyProfile(),
                            ),
                          );
                        },
                        color: green550,
                      ),
                    )
                  ],
                ),
              )
          : Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFFEFEFEF),
            ),
            child: ListView.builder(
                itemCount: profileProvider.profileModel.response.length,
                itemBuilder: (context, index) {
                  var profileData = profileProvider.profileModel.response[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: index == 0 ? 16 : 4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        height: 47,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFAFAFA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  profileData.name,
                                  style: medium12Grey500,
                                ),
                                Text(
                                  profileData.relation,
                                  style: medium10Grey200,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }
}
