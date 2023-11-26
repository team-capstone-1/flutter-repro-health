import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ForumThirdList extends StatelessWidget {
  const ForumThirdList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Forum",
      isActive: true,
      height: 230,
      text1: "Bagaimana saya bisa menghapus forum yang sudah saya buat?\n",
      text2: "Ikuti langkah berikut untuk menghapus forum:",
      text3: "1. Pilih tab bar 'Pertanyaan Saya' \n2. Pilih salah satu forum \n3. Pilih ikon sampah untuk menghapus forum terpilih \n4. Pilih 'Ya, Hapus' \n5. Forum berhasil terhapus",
      );
  }
}