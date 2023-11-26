import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ArtikelThirdList extends StatelessWidget {
  const ArtikelThirdList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Artikel",
      isActive: true,
      height: 250,
      text1: "Bagaimana saya bisa menghapus artikel yang sudah disimpan?\n",
      text2: "Ikuti langkah berikut untuk menghapus artikel:",
      text3: "1. Pilih 'Artikel' pada menu bagian bawah layar. \n2. Pilih ikon simpan di pojok kanan atas. \n3. Pilih ikon sampah di pojok kanan atas. \n4. Pilih artikel yang ingin dihapus. \n5. Pilih ‘Ya’ untuk menghapus. \n6. Artikel berhasil dihapus.",

    );
  }
}