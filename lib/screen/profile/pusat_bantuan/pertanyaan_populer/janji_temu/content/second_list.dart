import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiSecondList extends StatelessWidget {
  const JanjiSecondList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: true,
      height: 180,
      text1: "Bagaimana cara melihat status janji temu saya?\n",
      text2: "Untuk melihat status janji temu:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih janji temu untuk melihat detailnya.",
    );
  }
}