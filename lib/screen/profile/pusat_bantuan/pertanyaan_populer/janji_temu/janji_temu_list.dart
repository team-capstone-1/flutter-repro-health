import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/fifth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/first_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/forth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/second_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/seventh_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/sixth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/janji_temu/content/third_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JanjiTemuList extends StatelessWidget {
  const JanjiTemuList({super.key});

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
        title: Text("Janji Temu",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Bagaimana cara melihat detail janji temu \nsaya?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiFirstList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana cara melihat status janji temu \nsaya?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiSecondList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Saya tidak bisa membuat pesanan janji temu,\nApa yang harus saya lakukan?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiThirdList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana cara membatalkan janji temu \nsaya?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiForthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana cara membuat janji offline di \nReproHealth?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiFifthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana cara mengubah jadwal janji \ntemu saya?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiSixthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Kapan saya akan menerima pengembalian \ndana untuk janji offline yang dibatalkan?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const JanjiSeventhList()
                )
              ),
          ),
        ],
      ),
    );
  }
}