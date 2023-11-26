import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class ForumForthList extends StatelessWidget {
  const ForumForthList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Forum",
      isActive: false,
      height: 180,
      text1: "Bagaimana tampilan forum saya ketika saya mengirimnya sebagai anonim?\n",
      text2: "Untuk forum yang terkirim dari anonim, foto profil dan nama pasien sudah kami privasi",
    );
  }
}