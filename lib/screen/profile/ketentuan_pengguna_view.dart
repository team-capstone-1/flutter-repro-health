import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/term_condition_widget.dart';

class KetentuanPenggunaView extends StatelessWidget {
  const KetentuanPenggunaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TermandConditionWidget(
      appbarTitle: "Ketentuan Pengguna",
      title: "SYARAT DAN KETENTUAN PENGGUNA REPROHEALTH", 
      date: "Berlaku efektif 30 Oktober 2023",
      subtitle1: "1. Penerimaan Syarat dan Ketentuan Penggunaan", 
      text1: "Dengan mengunduh, menginstal, atau menggunakan aplikasi ReproHealth ('Aplikasi'), pengguna setuju untuk mematuhi syarat dan ketentuan penggunaan ini sepenuhnya. Jika Anda tidak setuju dengan syarat dan ketentuan ini, harap tidak menggunakan aplikasi ini.", 
      subtitle2: "2. Penggunaan Aplikasi",
      text2: "2.1 Batasan Penggunaan : Aplikasi ini hanya boleh digunakan oleh individu yang berusia 18 tahun atau lebih.\n2.2 Penggunaan yang Dilarang : Aplikasi ini hanya boleh digunakan oleh individu yang berusia 18 tahun atau lebih.",
      subtitle3: "3. Privasi dan Keamanan",
      text3: "3.1 Privasi Pengguna : ReproHealth menghormati privasi pengguna. Data pribadi yang diberikan pengguna akan diatur sesuai dengan Kebijakan Privasi yang berlaku.3.2 Keamanan Akun :  Pengguna bertanggung jawab atas keamanan dan kerahasiaan informasi akun mereka. Pengguna harus segera memberi tahu tim ReproHealth Connect jika ada penggunaan yang tidak sah atau akses tanpa izin ke akun mereka.",
      subtitle4: "4. Perubahan pada Aplikasi dan Syarat Ketentuan",
      text4: "ReproHealth, dengan kebijaksanaan penuh, berhak untuk mengubah atau menghentikan aplikasi ini, termasuk syarat dan ketentuan penggunaan, kapan saja tanpa pemberitahuan sebelumnya. Setiap perubahan akan berlaku segera setelah diposting di aplikasi, dan pengguna diharapkan secara rutin memeriksa pembaruan untuk tetap mematuhi ketentuan terbaru.",
      subtitle5: "5. Penafian dan Tanggung Jawab",
      text5: "5.1 Penafian : Aplikasi ini disediakan 'apa adanya' tanpa jaminan apapun, baik secara tersurat maupun tersirat.5.2 Tanggung Jawab Pengguna : Pengguna setuju bahwa penggunaan aplikasi ini adalah risiko mereka sendiri, dan ReproHealth tidak bertanggung jawab atas kerugian atau kerusakan yang timbul akibat penggunaan aplikasi ini.",
      subtitle6: "6. Hukum yang berlaku",
      text6: "Syarat dan ketentuan penggunaan ini diatur oleh hukum yang berlaku di wilayah yurisdiksi ReproHealth, tanpa memperhatikan konflik prinsip-prinsip hukum. Dengan menggunakan Aplikasi ReproHealth, pengguna dianggap telah membaca, memahami, dan menyetujui syarat dan ketentuan penggunaan ini. Syarat dan ketentuan ini berlaku efektif sejak pengguna mulai menggunakan aplikasi ini.",
      );
  }
}