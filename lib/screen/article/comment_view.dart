import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/models/profile_models/profile_models.dart';
import 'package:reprohealth_app/screen/article/widgets/comment_card.dart';
import 'package:reprohealth_app/services/article_services/article_services.dart';
import 'package:reprohealth_app/services/profile_service/profile_service.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CommentView extends StatefulWidget {
  const CommentView({Key? key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  String _sortingOption = 'Terbaru';
  Future<ProfileModel?> getLoggedInPatient(BuildContext context) async {
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

  Future<List<CommentModel>> fetchCommentsForArticle(
      String articleId, ProfileModel? loggedInPatient) async {
    try {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Komentar',
            style: semiBold16Black,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: secondary),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: getLoggedInPatient(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Text(
                    'Failed to load patient details: ${snapshot.error}');
              } else {
                ProfileModel? loggedInPatient = snapshot.data;

                final List<CommentModel> comments = ModalRoute.of(context)
                    ?.settings
                    .arguments as List<CommentModel>;

                if (_sortingOption == 'Terbaru') {
                  comments.sort((a, b) => b.date.compareTo(a.date));
                } else if (_sortingOption == 'Terlama') {
                  comments.sort((a, b) => a.date.compareTo(b.date));
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingOption = 'Terbaru';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _sortingOption == 'Terbaru'
                                      ? green600
                                      : grey10,
                                  border: Border.all(
                                      color: _sortingOption == 'Terbaru'
                                          ? green800
                                          : green500)),
                              child: Text(
                                'Terbaru',
                                style: _sortingOption == 'Terbaru'
                                    ? medium14Primary
                                    : medium14Green500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _sortingOption = 'Terlama';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _sortingOption == 'Terlama'
                                      ? green600
                                      : grey10,
                                  border: Border.all(
                                      color: _sortingOption == 'Terlama'
                                          ? green800
                                          : green500)),
                              child: Text(
                                'Terlama',
                                style: _sortingOption == 'Terlama'
                                    ? medium14Primary
                                    : medium14Green500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            CommentModel comment = comments[index];

                            comment.patientDetails =
                                loggedInPatient?.response?[0];

                            return Column(
                              children: [
                                CommentCard(
                                  image: comment.patientDetails?.profileImage ??
                                      '',
                                  name: comment.patientDetails?.name ?? '',
                                  date: DateFormat('dd MMMM yyyy')
                                      .format(comment.date.toLocal()),
                                  comment: comment.comment,
                                ),
                                const Divider(
                                  thickness: 1,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
