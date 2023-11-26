import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatForthList extends StatelessWidget {
  const RiwayatForthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: true,
      height: 190,
      text1: "Bagaimana saya bisa mendapatkan invoice dari janji temu dengan Dokter?\n",
      text2: "Ikuti langkah berikut untuk mendapatkan invoice:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih tab bar 'Selesai', dan pilih 'Lihat rincian' \n3. Pilih 'Lihat invoice' untuk menampilkan invoice",
    );
  }
}