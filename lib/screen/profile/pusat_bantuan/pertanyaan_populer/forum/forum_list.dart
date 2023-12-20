import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/content/fifth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/content/first_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/content/forth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/content/second_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/forum/content/third_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForumList extends StatelessWidget {
  const ForumList({super.key});

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
        title: Text("Forum",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa membuat forum baru?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumFirstList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa membuat forum baru \nsecara anonim?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumSecondList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa menghapus forum \nyang sudah saya buat?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumThirdList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana tampilan forum ketika saya \nmengirimnya sebagai anonim?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
           onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumForthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Berapa lama forum saya akan dijawab oleh \nDokter?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const ForumFifthList()
                )
              ),
          ),
        ],
      ),
    );
  }
}