import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<CommentModel> comments =
        ModalRoute.of(context)?.settings.arguments as List<CommentModel>;
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
          ],
        ),
      ),
    );
  }
}
