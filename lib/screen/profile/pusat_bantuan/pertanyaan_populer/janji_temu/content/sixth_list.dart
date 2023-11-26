import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiSixthList extends StatelessWidget {
  const JanjiSixthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: true,
      isActive2: true,
      height: 250,
      text1: "Bagaimana cara mengubah jadwal janji temu saya?\n",
      text2: "Ikuti langkah berikut untuk mengubah jadwal janji temu:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih janji yang ingin kamu ubah dan klik 'Ubah Jadwal'. \n3. Pilih tanggal dan waktu yang baru.",
      text4: "Apabila langkah di atas ini sudah tidak bisa dilakukan dan kamu perlu mengubah jadwal, hubungi email ReproHealth di helpreprohealth@gmail.com.",
    );
  }
}