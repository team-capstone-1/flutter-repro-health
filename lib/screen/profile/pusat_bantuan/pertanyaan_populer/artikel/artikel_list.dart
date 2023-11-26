import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/artikel/content/first_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/artikel/content/second_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/artikel/content/third_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArtikelList extends StatelessWidget {
  const ArtikelList({super.key});

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
        title: Text("Artikel",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Sumber artikel di dapatkan darimana?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ArtikelFirstList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa menyimpan artikel?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ArtikelSecondList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa menghapus artikel \nyang sudah disimpan?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ArtikelThirdList()
                )
              ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}