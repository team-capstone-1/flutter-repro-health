import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ForumSecondList extends StatelessWidget {
  const ForumSecondList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Forum",
      isActive: true,
      height: 280,
      text1: "Bagaimana saya bisa membuat forum baru secara anonim?\n",
      text2: "Ikuti langkah berikut untuk membuat forum baru:",
      text3: "1. Pilih 'Forum' pada menu bagian bawah layar \n2. Pilih ikon pensil untuk membuat forum baru \n3. Tuliskan judul forum dan detail forum \n4. Centang 'Kirim sebagai anonim' \n5. Klik tombol kirim untuk membuat forum \n6. Forum berhasil dibuat \n7. Forum akan dijawab oleh Dokter selama 1 x 24 jam \n    setelah forum dibuat",
    );
  }
}