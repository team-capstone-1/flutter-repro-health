import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailForumView extends StatelessWidget {
  const DetailForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kembali ke Forum',
          style: semiBold16Grey700,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(Assets.assetsTrashCan),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Text(
              'Efek rokok terhadap reproduksi',
              style: semiBold16Grey900,
            ),
            const SizedBox(height: 24),
            Text(
              'Saya seorang perokok dan saya khawatir bahwa kebiasaan merokok saya mungkin berdampak pada kesuburan saya. Apakah ada penelitian yang mengaitkan antara merokok dan masalah kesuburan pada pria? Saya ingin memahami risikonya dan bagaimana saya bisa mengurangi dampak negatif rokok pada kesehatan reproduksi saya.',
              style: regular12Grey900,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Row(
              
            ),
          ],
        ),
      ),
    );
  }
}
