import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: secondary),
        ),
        title: Text('Bookmark', style: semiBold16Black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: negative),
          )
        ],
        backgroundColor: grey10,
        elevation: 0,
      ),
    );
  }
}
