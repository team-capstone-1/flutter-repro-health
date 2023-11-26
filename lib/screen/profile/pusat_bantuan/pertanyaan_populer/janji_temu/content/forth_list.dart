import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiForthList extends StatelessWidget {
  const JanjiForthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: true,
      height: 180,
      text1: "Bagaimana cara membatalkan janji temu saya?\n",
      text2: "Ikuti langkah berikut untuk membatalkan janji temu:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih janji yang ingin dibatalkan. \n3. Pilih 'Batalkan'.",
    );
  }
}