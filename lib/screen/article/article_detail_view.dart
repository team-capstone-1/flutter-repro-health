import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleDetailView extends StatefulWidget {
  const ArticleDetailView({super.key});

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  bool isBookmark = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ArticleModels article =
        ModalRoute.of(context)?.settings.arguments as ArticleModels;

    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage('assets/article_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: secondary),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isBookmark = !isBookmark;
                            });
                          },
                          icon: Icon(
                            isBookmark
                                ? Icons.bookmark
                                : Icons.bookmark_add_outlined,
                            color: secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: semiBold20Black,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      children: List.generate(
                        article.tags.length,
                        (index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: green100,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 5),
                              child: Text(
                                article.tags[index],
                                style: semiBold12Black400,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            article.image,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.title, style: medium10Black500),
                            Text(
                              'Diunggah pada 18 Agustus 2023 pukul 18.00 WIB',
                              style: regular8Black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.visibility_outlined),
                        const SizedBox(width: 2),
                        SizedBox(
                          width: 26,
                          child: Text(
                            article.views.toString(),
                            style: regular8Black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.bookmark_outline),
                        const SizedBox(width: 2),
                        SizedBox(
                          width: 26,
                          child: Text(
                            article.views.toString(),
                            style: regular8Black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.comment_outlined),
                        const SizedBox(width: 2),
                        SizedBox(
                          width: 26,
                          child: Text(
                            article.views.toString(),
                            style: regular8Black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      article.content,
                      style: regular12Black400,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Referensi',
                          style: medium10Black500,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          article.reference,
                          style: regular8Black400Italic,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Komentar (123)',
                          style: medium10Black500,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormComponent(
                      controller: controller,
                      hintText: 'Tambahkan Komentar...',
                      hinstStyle: regular10Grey400,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      ),
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   itemCount: article.comments != null ? 3 : 0,
                    //   itemBuilder: (context, index) {
                    //     if (article.comments != null &&
                    //         article.comments!.isEmpty) {
                    //       return Text(
                    //         'Belum ada Komentar',
                    //         style: medium8Black,
                    //       );
                    //     } else {
                    //       return ListTile(
                    //         contentPadding: const EdgeInsets.all(0),
                    //         title: Row(
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(100),
                    //               child: Image(
                    //                 image: AssetImage(
                    //                     article.comments![index].image),
                    //                 width: 24,
                    //                 height: 24,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //             const SizedBox(width: 8),
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Row(
                    //                   children: [
                    //                     Text(
                    //                       article.comments![index].name,
                    //                       style: medium10Black500,
                    //                     ),
                    //                     const SizedBox(width: 4),
                    //                     Text(
                    //                       article.comments![index].time,
                    //                       style: regular8Black,
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 const SizedBox(height: 4),
                    //                 Text(
                    //                   article.comments![index].comment,
                    //                   style: regular8Black,
                    //                 ),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }
                    //   },
                    // )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
