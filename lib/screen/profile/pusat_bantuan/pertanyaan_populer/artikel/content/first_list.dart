import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ArtikelFirstList extends StatelessWidget {
  const ArtikelFirstList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Artikel",
      isActive: false,
      height: 180,
      text1: "Sumber artikel di dapatkan darimana?\n",
      text2: "Artikel yang ditampilkan bersumber dari Dokter yang berpengalaman dalam kesehatan reproduksi, konten \nyang disajikan sudah melalui tahap penyuntingan oleh tim medis dan editor bahasa untuk memastikan kelayakan informasi kesehatan yang diterbitkan.",
    );
  }
}