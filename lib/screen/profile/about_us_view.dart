import 'package:flutter/material.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
        title: Text("Tentang ReproHealth",
        style: semiBold16Primary4,
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 934,
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text("ReproHealth, Platform Kesehatan Reproduksi No.1 di Indonesia Siap Membantu Anda",
                  style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ReproHealth selalu menghadirkan layanan kesehatan reproduksi terbaik dan terlengkap. \n\nSebagai platform kesehatan reproduksi nomor 1 di Indonesia, ReproHealth menyediakan fitur yang dirancang untuk memudahkan pengguna dalam memenuhi kebutuhan kesehatan reproduksi mereka.',
                  textAlign: TextAlign.justify,
                  style: regular14Grey500,
                  ),
                  const SizedBox(height: 25),
                  Text("Kesehatan Anda yang Utama",
                  style: semiBold14Grey500,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Maraknya kemudahan informasi di era teknologi seperti saat ini, membuat masyarakat kebingungan dalam menemukan informasi kesehatan reproduksi yang memadai dan terpercaya.\n\nOleh karena itu, ReproHealth menyediakan konten kesehatan reproduksi dalam format tulisan berdasarkan referensi medis yang kredibel dengan Bahasa Indonesia sehingga mudah dipahami oleh masyarakat. Konten yang disajikan sudah melalui tahap penyuntingan oleh tim medis dan editor bahasa untuk memastikan kelayakan informasi kesehatan yang diterbitkan.\n\nUntuk memperoleh penanganan medis terbaik, pengguna bisa memanfaatkan fitur Janji Temu. Fitur ini membantu pengguna menjadwalkan konsultasi dengan dokter berpengalaman di klinik yang sudah bermitra dengan ReproHealth yang tersebar di seluruh Indonesia.\n\nReproHealth akan terus mengembangkan fitur-fitur yang ada demi memenuhi kebutuhan masyarakat dan kemajuan kesehatan reproduksi di Indonesia.',
                  textAlign: TextAlign.justify,
                  style: regular14Grey500,
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}