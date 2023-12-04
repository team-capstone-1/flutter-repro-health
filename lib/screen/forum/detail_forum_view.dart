import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/models/forum_models/forum_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailForumView extends StatelessWidget {
  const DetailForumView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResponseData?;
    final ResponseData? detailForum = args;

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
              detailForum?.title ?? '',
              style: semiBold16Grey900,
            ),
            const SizedBox(height: 24),
            Text(
              detailForum?.content ?? '',
              style: regular12Grey900,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const ClipRRect(
                  child: Icon(Icons.people),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Ditanyakan oleh ",
                  style: regular12Grey900,
                ),
                Text(
                  "Nakamura (Anda)",
                  style: semiBold12Grey900,
                ),
              ],
            ),
            const SizedBox(height: 48),
            detailForum?.forumReplies?.isNotEmpty == true ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 8,
                  ),
                  width: double.infinity,
                  color: green100,
                  child: Row(
                    children: [
                      const ClipRRect(
                        child: Icon(Icons.people),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Dijawab oleh ",
                        style: regular12Grey900,
                      ),
                      Text(
                        detailForum?.forumReplies?.first.doctor?.name ?? '',
                        style: medium12Green700,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  color: green50,
                  width: double.infinity,
                  child: Text(
                    detailForum?.forumReplies?.first.content ?? '',
                    style: regular12Grey900,
                  ),
                ),
              ],
            ) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
