import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/article_services/article_Services.dart';
import 'package:reprohealth_app/theme/theme.dart';
import 'package:html/parser.dart';

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

    String formattedDateTime(DateTime dateTime) {
      String formattedDate = DateFormat('dd MMMM yyyy "pukul" HH:mm "WIB"')
          .format(dateTime.toLocal());
      return 'Diunggah pada $formattedDate';
    }

    String parseContent(String content) {
      final document = parse(content);
      final String parsedContent =
          parse(document.body!.text).documentElement!.text;

      return parsedContent;
    }

    Future<void> postComment() async {
      try {
        ResponseDataProfile? currentUserProfile =
            await ArticleServices().getCurrentUserProfile();

        if (currentUserProfile != null) {
          String patientId = currentUserProfile.id ?? '';
          String articleId = article.id;
          String comment = controller.text;

          if (comment.isNotEmpty) {
            await ArticleServices().createComment(
              patientId: patientId,
              comment: comment,
              articleId: articleId,
            );

            setState(() {
              controller.clear();
            });
          }
        } else {
          print('Error: Current user profile not available');
        }
      } catch (e) {
        print('Error posting comment: $e');
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(article.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, color: secondary),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
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
                    Row(
                      children: article.tags.split(',').map((tag) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: green100,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              tag.trim(),
                              style: regular8Black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            article.doctor?.profileImage ?? '',
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article.doctor?.name ?? '',
                                style: medium10Black500),
                            Text(
                              formattedDateTime(article.date),
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
                      parseContent(article.content),
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
                        onPressed: postComment,
                        icon: const Icon(Icons.send),
                      ),
                    ),
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
