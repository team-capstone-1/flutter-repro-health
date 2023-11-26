import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatFifthList extends StatelessWidget {
  const RiwayatFifthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: false,
      height: 180,
      text1: "Bagaimana jika jadwal Dokter tidak tersedia?\n",
      text2: "Jika jadwal Dokter tidak tersedia, klik tombol 'Jadwal ulang' untuk merencanakan tanggal terbaru sesuai dengan ketersediaan jadwal Dokter, atau klik tombol 'Batal' untuk membatalkan janji temu",
    );
  }
}