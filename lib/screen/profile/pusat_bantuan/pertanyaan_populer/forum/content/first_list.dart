import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ForumFirstList extends StatelessWidget {
  const ForumFirstList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Forum",
      isActive: true,
      height: 250,
      text1: "Bagaimana saya bisa membuat forum baru?\n",
      text2: "Ikuti langkah berikut untuk membuat forum baru:",
      text3: "1. Pilih 'Forum' pada menu bagian bawah layar \n2. Pilih ikon pensil untuk membuat forum baru \n3. Tuliskan judul forum dan detail forum \n4. Klik tombol kirim untuk membuat forum. \n5. Forum berhasil dibuat \n6. Forum akan dijawab oleh Dokter selama 1 x 24 jam \n    setelah forum dibuat",
    );
  }
}