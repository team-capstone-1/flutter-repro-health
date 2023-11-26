import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiFifthList extends StatelessWidget {
  const JanjiFifthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: true,
      height: 300,
      text1: "Bagaimana cara membuat janji offline di ReproHealth?\n",
      text2: "Ikuti langkah berikut untuk membuat janji temu pada \naplikasi ReproHealth?",
      text3: "1. Pilih 'Janji Temu' \n2. Pilih spesialisasi medis atau dokter \n3. Pilih slot yang tersedia dan pilih ‘Lanjut’. \n4. Konfirmasi atau lengkapi detail pasien. Pilih ‘Lanjut’. \n5. Cek kembali detail pesananmu, lalu pilih metode \n    pembayaranmu. Kemudian, pilih ‘Lanjut ke \n    Pembayaran’ dan selesaikan pembayaran. \n6. Janji temu kamu berhasil dibuat.",

    );
  }
}