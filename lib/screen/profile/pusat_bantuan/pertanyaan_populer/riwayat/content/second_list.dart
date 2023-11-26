import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatSecondList extends StatelessWidget {
  const RiwayatSecondList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: false,
      height: 180,
      text1: "Jika transaksi saya dibatalkan, apakah dana saya akan dikembalikan?\n",
      text2: "Ya, pengembalian dana akan diproses secara otomatis apabila pemesanan dibatalkan.",
    );
  }
}