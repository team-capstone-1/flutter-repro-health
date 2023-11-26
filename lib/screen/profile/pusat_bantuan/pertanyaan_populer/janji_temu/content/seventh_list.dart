import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/pusat_bantuan_widget.dart';

class JanjiSeventhList extends StatelessWidget {
  const JanjiSeventhList({super.key});

  @override
  Widget build(BuildContext context) {
    return const PusatBantuanWidget(
      title: "Janji Temu",
      isActive: false,
      height: 250,
      text1: "Kapan saya akan menerima pengembalian dana untuk janji offline yang dibatalkan?\n",
      text2: "Berikut adalah perkiraan kapan pengembalian danamu akan diterima:\n\nKartu Debit : Maksimal 14 hari kerja tergantung bank (tidak termasuk hari Sabtu, Minggu & Libur Nasional). \nApabila sudah lewat dari waktu di atas dan kamu belum menerima pengembalian dana, hubungi email \nReproHealth di helpreprohealth@gmail.com.",
    );
  }
}