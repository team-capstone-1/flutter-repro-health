import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiFirstList extends StatelessWidget {
  const JanjiFirstList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: true,
      height: 180,
      text1: "Bagaimana cara melihat detail janji temu saya?\n",
      text2: "Ikuti langkah berikut untuk melihat detail janji temu kamu:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih janji temu untuk melihat detailnya.",
    );
  }
}