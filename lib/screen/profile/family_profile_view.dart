import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/add_family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/edit_family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/view_model/get_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class FamilyProfile extends StatefulWidget {
  const FamilyProfile({super.key});

  @override
  State<FamilyProfile> createState() => _FamilyProfileState();
}

class _FamilyProfileState extends State<FamilyProfile> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var profileProvider = Provider.of<GetFamilyProfileViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    profileProvider.fetchProfileData(context: context);
  });
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
          actions: <Widget>[
              Visibility(
                visible: profileProvider.profileList!.response!.isNotEmpty,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesNavigation.addFamilyProfile,
                    );
                  },
                  
                  child: Text(
                    "Tambah",
                    style: semiBold16Green500,
                  ),
                ),
              )
          ],
        ),
        body: profileProvider.profileList?.response?.isEmpty?? false
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
                          color: green500,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEFEFEF),
                  ),
                  child: Consumer<GetFamilyProfileViewModel>(
                    builder: (context, getFamilyProfileViewModel, child) {
                      final listFamily = getFamilyProfileViewModel.profileList;
                      return ListView.builder(
                        itemCount: listFamily?.response?.length?? 0,
                        itemBuilder: (context, index) {
                          var profileData = listFamily?.response?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditFamilyProfile(
                                  idPatients: profileData?.id,
                                  relation: profileData?.relation,
                                  date: DateFormat('dd/MM/yyyy').format(profileData?.dateOfBirth?? DateTime.now()),
                                  nameController: profileData?.name,
                                  nomorController: profileData?.telephoneNumber,
                                  beratController: profileData?.weight,
                                  tinggiController: profileData?.height,
                                  gender: profileData?.gender,
                                ),
                              ),
                            );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: index == 0 ? 16 : 4),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          profileData?.name ?? "",
                                          style: medium12Grey500,
                                        ),
                                        Text(
                                          profileData?.relation ?? "",
                                          style: medium10Grey200,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.keyboard_arrow_right),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
    );
  }
}