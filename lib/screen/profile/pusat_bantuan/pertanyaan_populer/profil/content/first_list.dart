import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ProfilFirstList extends StatelessWidget {
  const ProfilFirstList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Profil",
      isActive: true,
      height: 205,
      text1: "Bagaimana cara menambahkan profil lain?\n",
      text2: "Ikuti langkah berikut untuk menambahkan profil:",
      text3: "1. Pilih ‘Profil’ pada menu bagian bawah layar \n2. Pilih 'Keluarga Saya' \n3. Pilih 'Tambah' pada sudut kanan atas menu \n4. Isi data dengan lengkap \n5. Simpan dan Profil berhasil ditambahkan",
    );
  }
}