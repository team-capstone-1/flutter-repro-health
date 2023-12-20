import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/fifth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/first_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/forth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/second_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/sixth_list.dart';
import 'package:reprohealth_app/screen/profile/pusat_bantuan/pertanyaan_populer/riwayat/content/third_list.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/profile_menu_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RiwayatList extends StatelessWidget {
  const RiwayatList({super.key});

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
        title: Text("Riwayat Transaksi",
        style: semiBold16Primary4,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          ProfilMenuWidget(
            title: "Berapa lama estimasi pengembalian dana \n(refund) ReproHealth?",
            textStyle: semiBold12Black500,
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatFirstList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Jika transaksi saya dibatalkan, apakah dana \nsaya akan dikembalikan?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatSecondList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa membuat janji temu \nkembali dengan Dokter ?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatThirdList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa mendapatkan invoice \ndari janji temu dengan Dokter?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatForthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana jika jadwal Dokter tidak tersedia?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatFifthList()
                )
              ),
          ),
          const SizedBox(height: 4),
          ProfilMenuWidget(
            title: "Bagaimana saya bisa mengganti jadwal janji \ntemu?", 
            textStyle: semiBold12Black500, 
            icon: Icons.keyboard_arrow_right,
            onTap: () => Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RiwayatSixthList()
                )
              ),
          ),
        ],
      ),
    );
  }
}