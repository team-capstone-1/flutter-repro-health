import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ProfilSecondList extends StatelessWidget {
  const ProfilSecondList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Profil",
      isActive: true,
      height: 230,
      text1: "Bagaimana saya dapat memperbarui informasi profil ReproHealth?\n",
      text2: "Ikuti langkah berikut untuk memperbarui profil:",
      text3: "1. Pilih ‘Profil’ pada menu bagian bawah layar \n2. Pilih 'Keluarga Saya'' \n3. Pilih salah satu Profil \n4. Ubah data Profil \n5. Simpan dan data Profil berhasil diubah",
    );
  }
}