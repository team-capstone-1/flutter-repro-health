import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatThirdList extends StatelessWidget {
  const RiwayatThirdList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: true,
      height: 210,
      text1: "Bagaimana saya bisa membuat janji temu kembali dengan Dokter?\n",
      text2: "Ikuti langkah berikut untuk membuat janji temu kembali:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih tab bar 'Selesai', dan pilih 'Lihat rincian' \n3. Klik tombol 'Janji temu lagi' untuk membuat janji temu \n    dengan Dokter",
      );
  }
}