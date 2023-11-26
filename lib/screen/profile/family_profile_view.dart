import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/add_family_profile_view.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class FamilyProfile extends StatelessWidget {
  const FamilyProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: Text("Profil Keluarga Saya",
        style: semiBold16Primary4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Belum Ada Profil Anggota Keluarga",
            style: semiBold16Grey500,
            ),
            const SizedBox(height: 16),
            Text(
              'Simpan profil anggota keluarga Anda di sini agar\ndapat membuat janji bersama dokter \ndengan lebih mudah',
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
                  context, MaterialPageRoute(
                    builder: (_) => const AddFamilyProfile()
                    )
                  );
                }, 
                color: green550
                ),
            )
          ],
        ),
      ),
    );
  }
}