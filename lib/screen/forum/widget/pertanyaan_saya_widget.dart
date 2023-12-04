import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PertanyaanSayaWidget extends StatefulWidget {
  const PertanyaanSayaWidget({Key? key}) : super(key: key);

  @override
  State<PertanyaanSayaWidget> createState() => _PertanyaanSayaWidgetState();
}

class _PertanyaanSayaWidgetState extends State<PertanyaanSayaWidget> {
  @override
  void initState() {
    // Provider.of<ForumViewModel>(context).getProfile(context: context);
    Provider.of<ForumViewModel>(context, listen: false).getMyForumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForumViewModel>(
      builder: (context, forumViewModel, child) {
        final myForumList = forumViewModel.myForumList;
        final searchResults = forumViewModel.searchResults;
        final displayedList = searchResults ?? myForumList?.response;
        if (myForumList == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Urutan daftar berdasarkan kategori yang berbeda
        myForumList.response?.sort((a, b) {
          // Terbaru
          if (forumViewModel.kategoriListMap.contains('Terbaru')) {
            return b.date!.compareTo(a.date!);
          }

          // Terlama
          else if (forumViewModel.kategoriListMap.contains('Terlama')) {
            return a.date!.compareTo(b.date!);
          }

          // Populer
          else if (forumViewModel.kategoriListMap.contains('Populer')) {
            return b.view!.compareTo(a.view!);
          }

          // filter berdasarkan tanggal
          return b.date!.compareTo(a.date!);
        });

        return ListView.builder(
          itemCount: displayedList?.length,
          itemBuilder: (context, index) {
            final myForum = displayedList?[index];
            return myForum == null
                ? const Center(
                    child: Text('Tidak terdapat pertanyaan'),
                  )
                : SizedBox(
                    width: 360.0,
                    height: 220.0,
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
                                      myForum.status == true
                                          ? "Terjawab"
                                          : "Belum Terjawab",
                                      style: myForum.status == true
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
                                      myForum.date.toString(),
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
                                  myForum.title ?? '',
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
                                  myForum.content ?? '',
                                  textAlign: TextAlign.justify,
                                  style: regular10Grey400,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AvatarStack(
                                    height: 32,
                                    width: 53.82,
                                    avatars: [
                                      for (var n = 0; n < 2; n++)
                                        const NetworkImage(
                                          'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg',
                                        ),
                                    ],
                                  ),
                                  // Image.asset(
                                  //   Assets.assetsPhotoProfilPertanyaan,
                                  //   width: 53.82,
                                  //   height: 32,
                                  // ),
                                  const SizedBox(width: 168),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RoutesNavigation.detailForumView);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Lihat Pertanyaan',
                                          style: regular12Grey400,
                                        ),
                                        const SizedBox(width: 8),
                                        Image.asset(
                                          Assets.assetsNextIcon,
                                          width: 6.59,
                                          height: 11.17,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          myForum.date.toString(),
                                          style: regular10Grey200,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
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
