import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ForumFifthList extends StatelessWidget {
  const ForumFifthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Forum",
      isActive: false,
      height: 180,
      text1: "Berapa lama forum saya akan dijawab oleh Dokter?\n",
      text2: "Dokter akan menjawab dalam waktu 1 x 24 jam setelah pasien membuat forum",
    );
  }
}