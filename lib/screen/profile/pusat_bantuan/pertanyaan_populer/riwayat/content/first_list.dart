import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatFirstList extends StatelessWidget {
  const RiwayatFirstList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: false,
      height: 200,
      text1: "Berapa lama estimasi pengembalian dana (refund) ReproHealth?\n",
      text2: "Pengembalian dana untuk transaksi menggunakan kartu debit akan diproses secara otomatis dan dikirimkan ke kartumu. \nDana akan masuk dalam maks. 14 hari kerja. Sabtu, \nMinggu dan Hari Libur Nasional tidak termasuk hari kerja.",
    );
  }
}