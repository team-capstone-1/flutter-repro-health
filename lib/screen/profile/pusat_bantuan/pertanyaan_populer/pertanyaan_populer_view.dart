import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/artikel/artikel_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/forum_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/janji_temu_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/profil/profil_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/riwayat_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PertanyaanPopulerView extends StatelessWidget {
  const PertanyaanPopulerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text("Pertanyaan Populer",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Janji Temu",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiTemuList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Artikel", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ArtikelList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Forum", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Riwayat Transaksi", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Profil", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ProfilList()
                )
              ),
          ),
        ],
      ),
    );
  }
}