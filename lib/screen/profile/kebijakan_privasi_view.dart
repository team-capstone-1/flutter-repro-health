import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/term_condition_widget.dart';

class KebijakanPrivasiView extends StatelessWidget {
  const KebijakanPrivasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TermandConditionWidget(
      appbarTitle: "Kebijakan Privasi",
      title: "KEBIJAKAN PRIVASI REPROHEALTH", 
      date: "Berlaku efektif 30 Oktober 2023",
      subtitle1: "1. Penerimaan Kebijakan Privasi", 
      text1: "Dengan menggunakan aplikasi ReproHealth ('Aplikasi'), Anda menyetujui pengumpulan, penggunaan, pengungkapan, dan penyimpanan informasi pribadi Anda sesuai dengan kebijakan privasi ini. Jika Anda tidak setuju dengan kebijakan privasi ini, harap tidak menggunakan Aplikasi ini.", 
      subtitle2: "2. Informasi yang Kami Kumpulkan",
      text2: "2.1 Informasi Pribadi : Kami dapat mengumpulkan informasi pribadi seperti nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar atau menggunakan Aplikasi.\n2.2 Informasi Non-Pribadi : Kami juga dapat mengumpulkan informasi non-pribadi yang tidak dapat mengidentifikasi Anda secara langsung, seperti tipe perangkat, jenis browser, dan data penggunaan Aplikasi.",
      subtitle3: "3. Penggunaan Informasi",
      text3: "3.1 Tujuan Pengumpulan Informasi : Kami menggunakan informasi yang kami kumpulkan untuk menyediakan, mengelola, dan meningkatkan Aplikasi, serta untuk memberi Anda layanan yang sesuai dengan kebutuhan Anda.\n3.2 Pemberitahuan dan Komunikasi : Kami dapat menggunakan informasi kontak Anda untuk mengirim pemberitahuan, pembaruan, dan informasi terkait layanan kami.",
      subtitle4: "4. Pengungkapan Informasi",
      text4: "4.1 Pengungkapan ke Pihak Ketiga: : Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali jika diwajibkan oleh hukum atau untuk melindungi keamanan kami atau hak-hak pengguna lain.\n4.2 Mitigasi Data : Kami akan mengambil langkah-langkah yang wajar untuk melindungi informasi pribadi Anda dari kehilangan, penyalahgunaan, akses yang tidak sah, pengungkapan, perubahan, dan penghapusan yang tidak sah.",
      subtitle5: "5. Perubahan pada Kebijakan Privasi",
      text5: "Kebijakan privasi ini dapat diperbarui dari waktu ke waktu. Perubahan substansial pada kebijakan privasi ini akan diberitahukan kepada pengguna melalui pemberitahuan di Aplikasi atau melalui kontak informasi yang disediakan oleh pengguna.",
      subtitle6: "6. Hukum yang berlaku",
      text6: "Jika Anda memiliki pertanyaan, komentar, atau keluhan tentang kebijakan privasi ini atau praktik kami dalam mengelola informasi pribadi, silakan hubungi kami melalui email di privacy@reprohealthconnect.com.\nDengan menggunakan Aplikasi ReproHealth Connect, Anda mengakui bahwa Anda telah membaca, memahami, dan menyetujui kebijakan privasi ini serta setuju dengan pengumpulan dan penggunaan informasi Anda sesuai dengan ketentuan dalam kebijakan privasi ini. Kebijakan privasi ini berlaku efektif sejak tanggal Anda mulai menggunakan Aplikasi ini.",
      );
  }
}