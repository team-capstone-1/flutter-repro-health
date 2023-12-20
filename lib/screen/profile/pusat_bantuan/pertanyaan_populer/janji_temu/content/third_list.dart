import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiThirdList extends StatelessWidget {
  const JanjiThirdList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: false,
        height: 210,
        text1: "Saya tidak bisa membuat pesanan janji temu. \nApa yang harus saya lakukan?\n",
        text2: "Jika kamu mengalami kendala membuat pesanan janji temu di ReproHealth, coba perbarui aplikasi ReproHealth kamu hingga ke versi terbaru.\n\nJika masih mengalami kendala, silakan hubungi email ReproHealth di helpreprohealth@gmail.com.",
      );
  }
}