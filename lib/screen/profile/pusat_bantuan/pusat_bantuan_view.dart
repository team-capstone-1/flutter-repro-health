import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/pertanyaan_populer_view.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PusatBantuanView extends StatelessWidget {
  const PusatBantuanView({super.key});

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
        title: Text("Pusat Bantuan",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Pertanyaan Populer",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const PertanyaanPopulerView()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "ReproHealth Assistant", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () {}
          ),
        ],
      ),
    );
  }
}