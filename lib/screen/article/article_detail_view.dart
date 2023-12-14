import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/services/article_services/article_services.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';
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

    Future<String?> getLoggedInPatientId() async {
      try {
        ProfileModel profile =
            await ProfileService().getProfileModel(context: context);

        if (profile.response != null && profile.response!.isNotEmpty) {
          String? patientId = profile.response![0].id;

          if (patientId != null && patientId.isNotEmpty) {
            return patientId;
          } else {
            print('Patient ID is null or empty');
            return null;
          }
        } else {
          print('Profile response is empty');
          return null;
        }
      } catch (e) {
        print('Failed to get logged-in patient ID: $e');
        return null;
      }
    }

    Future<ProfileModel?> getLoggedInPatient() async {
      try {
        ProfileModel profile =
            await ProfileService().getProfileModel(context: context);

        if (profile.response != null && profile.response!.isNotEmpty) {
          return profile;
        } else {
          print('Profile response is empty');
          return null;
        }
      } catch (e) {
        print('Failed to get logged-in patient data: $e');
        return null;
      }
    }

    Future<List<CommentModel>> fetchCommentsForArticle(String articleId) async {
      try {
        ProfileModel? loggedInPatient = await getLoggedInPatient();

        if (loggedInPatient != null) {
          List<CommentModel> comments =
              await ArticleServices().getComment(articleId);

          for (CommentModel comment in comments) {
            comment.patientDetails = loggedInPatient.response![0];
          }

          return comments;
        } else {
          throw Exception(
              'Failed to fetch comments: Logged-in patient data is null');
        }
      } catch (e) {
        print('Failed to fetch comments: $e');
        return [];
      }
    }

    Future<void> postComment() async {
      final ArticleModels article =
          ModalRoute.of(context)?.settings.arguments as ArticleModels;

      try {
        String? patientId = await getLoggedInPatientId();
        String comment = controller.text.trim();

        if (article.id != null && patientId != null && comment.isNotEmpty) {
          print('Article ID: ${article.id}');
          print('Patient ID: $patientId');
          print('Comment: $comment');

          CommentModel? newComment = await ArticleServices().postComment(
              patientId: patientId, comment: comment, articleId: article.id!);

          if (newComment != null) {
            print('Comment posted successfully: ${newComment.comment}');

            setState(() {
              article.comments.insert(0, newComment);
            });

            controller.clear();
          } else {
            print('Failed to post comment: returned comment is null');
          }
        } else {
          print(
              'Comment cannot be empty, or patient ID or article ID is missing');
        }
      } catch (e) {
        print('Failed to post comment: $e');
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
                    FutureBuilder<List<CommentModel>>(
                      future: fetchCommentsForArticle(article.id!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                              'Failed to load comments: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('No comments available'),
                              const SizedBox(height: 16),
                              Text(
                                'Komentar (${snapshot.data?.length ?? 0})',
                                style: medium10Black500,
                              ),
                              const SizedBox(height: 4),
                              TextFormComponent(
                                controller: controller,
                                hintText: 'Tambahkan Komentar...',
                                hinstStyle: regular10Grey400,
                                suffixIcon: IconButton(
                                  onPressed: postComment,
                                  icon: const Icon(Icons.send),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Komentar (${snapshot.data?.length ?? 0})',
                                    style: medium10Black500,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormComponent(
                                controller: controller,
                                hintText: 'Tambahkan Komentar...',
                                hinstStyle: regular10Grey400,
                                suffixIcon: IconButton(
                                  onPressed: postComment,
                                  icon: const Icon(Icons.send),
                                ),
                              ),
                              const SizedBox(height: 16),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length > 3
                                    ? 3
                                    : snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  CommentModel comment = snapshot.data![index];
                                  return CommentCard(
                                    image:
                                        comment.patientDetails?.profileImage ??
                                            '',
                                    name: comment.patientDetails?.name ?? '',
                                    date: DateFormat('dd MMMM yyyy')
                                        .format(comment.date.toLocal()),
                                    comment: comment.comment,
                                  );
                                },
                              ),
                              ButtonComponent(
                                  labelText: Center(
                                    child: Text(
                                      'Lihat Semua Komentar',
                                      style: semiBold12Green500,
                                    ),
                                  ),
                                  elevation: 0,
                                  border: BorderSide(color: green500, width: 2),
                                  backgroundColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RoutesNavigation.commentView,
                                        arguments: article.comments);
                                  }),
                              const SizedBox(
                                height: 6,
                              )
                            ],
                          );
                        }
                      },
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

class CommentCard extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String comment;
  const CommentCard({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: medium12Black,
                ),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: regular8Black,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              comment,
              style: regular10Black,
            )
          ],
        )
      ],
    );
  }
}
