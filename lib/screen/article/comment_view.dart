import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleModels article =
        ModalRoute.of(context)!.settings.arguments as ArticleModels;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: green600,
                      border: Border.all(color: green800)),
                  child: Text(
                    'Terbaru',
                    style: medium14Primary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: grey10,
                      border: Border.all(color: green500)),
                  child: Text(
                    'Terlama',
                    style: medium14Green500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: article.comments?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            article.comments![index].image,
                            width: 40,
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
                                  article.comments![index].name,
                                  style: medium12Black,
                                ),
                                const SizedBox(width: 8),
                                Text(article.comments![index].time,
                                    style: regular8Black),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              article.comments![index].comment,
                              style: regular10Black,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
