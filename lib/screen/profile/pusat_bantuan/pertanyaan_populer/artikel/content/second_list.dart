import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ArtikelSecondList extends StatelessWidget {
  const ArtikelSecondList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Artikel",
      isActive: true,
      height: 180,
      text1: "Bagaimana saya bisa menyimpan artikel?\n",
      text2: "Ikuti langkah berikut untuk menyimpan artikel:",
      text3: "1. Pilih 'Artikel' pada menu bagian bawah layar. \n2. Pilih ikon simpan di artikel yang terpilih. \n3. Artikel berhasil disimpan.",
    );
  }
}