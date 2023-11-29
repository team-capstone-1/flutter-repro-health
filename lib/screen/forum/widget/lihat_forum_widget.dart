import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class LihatForumWidget extends StatelessWidget {
  const LihatForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ForumViewModel>(context, listen: false).getForumList();
    return Consumer<ForumViewModel>(
      builder: (context, forumViewModel, child) {
        final forumList = forumViewModel.forumList;
        return forumList == null
            ? const Center(
                child: Text('Tidak terdapat pertanyaan'),
              )
            : ListView.builder(
          itemCount: forumList.response?.length,
          itemBuilder: (context, index) {
            final forum = forumList.response?[index];
            return SizedBox(
              width: 360.0,
              height: 198.0,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          top: 16,
                          bottom: 8,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Text(
                                forum?.status == true
                                    ? "Terjawab"
                                    : "Belum Terjawab",
                                style: forum?.status == true
                                    ? regular10Green500
                                    : regular10Red,
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                Assets.assetsEllips,
                                width: 2,
                                height: 2,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Diunggah 4 hari yang lalu",
                                style: regular10Grey200,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 8,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            forum?.title ?? '',
                            style: medium14Grey900,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                          left: 16,
                          bottom: 12,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            forum?.content ?? '',
                            textAlign: TextAlign.justify,
                            style: regular10Grey400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.assetsPhotoProfilPertanyaan,
                              width: 53.82,
                              height: 32,
                            ),
                            const SizedBox(width: 168),
                            Text(
                              'Lihat Forum',
                              style: regular12Grey400,
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                                Assets.assetsNextIcon,
                                width: 6.59,
                                height: 11.17,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
