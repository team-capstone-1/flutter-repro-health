import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/screen/article/widgets/article_card.dart';
import 'package:reprohealth_app/theme/theme.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  bool isDeleting = false;
  List<bool> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    List<ArticleModels> bookmarkedItem =
        ModalRoute.of(context)?.settings.arguments as List<ArticleModels>;
    if (selectedItem.length != bookmarkedItem.length) {
      selectedItem =
          List<bool>.generate(bookmarkedItem.length, (index) => false);
    }
    IconButton deleteIconButton = IconButton(
      onPressed: () {
        setState(() {
          isDeleting = !isDeleting;
        });
        if (isDeleting) {}
      },
      icon: Icon(Icons.delete, color: negative),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: secondary),
        ),
        title: Text('Bookmark', style: semiBold16Black),
        actions: [deleteIconButton],
        backgroundColor: grey10,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: bookmarkedItem.length,
        itemBuilder: (context, index) {
          return ArticleCard(
            image: bookmarkedItem[index].image,
            title: bookmarkedItem[index].title,
            profileImage: bookmarkedItem[index].doctor.image,
            name: bookmarkedItem[index].doctor.name,
            date: bookmarkedItem[index].date,
            showIcon: isDeleting,
            onPressedIcon: () {
              setState(() {
                selectedItem[index] = !selectedItem[index];
              });
            },
            isSelected: selectedItem[index],
            selectedIcon: Icon(Icons.check_box, color: green600),
            unselectedIcon:
                Icon(Icons.check_box_outline_blank, color: green600),
          );
        },
      ),
    );
  }
}
