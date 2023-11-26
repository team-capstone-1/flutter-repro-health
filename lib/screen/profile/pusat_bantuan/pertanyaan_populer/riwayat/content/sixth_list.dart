import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class RiwayatSixthList extends StatelessWidget {
  const RiwayatSixthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Riwayat Transaksi",
      isActive: true,
      isActive2: true,
      height: 350,
      text1: "Bagaimana saya bisa mengganti jadwal janji temu?\n",
      text2: "Ikuti langkah berikut untuk mengganti jadwal janji temu:",
      text3: "1. Pilih 'Riwayat Transaksi' pada menu bagian bawah layar \n2. Pilih tab bar 'Diproses', dan pilih 'Lihat rincian' \n3. Pilih 'Ganti jadwal' untuk melakukan perubahan jadwal \n4. Pilih jadwal yang tersedia \n5. Pilih sesi (pagi, siang, dan malam) sesuai dengan \n    kebutuhan  \n6. Klik tombol 'Ganti jadwal' \n7. Berhasil mengubah jadwal",
      text4: "Catatan: \n  •  Jadwal Dokter yang tersedia berwarna hitam \n  •  Jadwal Dokter yang tidak tersedia berwarna abu-abu",
    );
  }
}