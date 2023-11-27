import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/screen/article/widgets/article_card.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  List<bool> isBookmark = [];
  List<ArticleModels> bookmarkedItem = [];
  List<ArticleModels> article = [
    ArticleModels.models1,
    ArticleModels.models2,
    ArticleModels.models3
  ];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: semiBold16Black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesNavigation.bookmarkView,
                  arguments: bookmarkedItem);
            },
            icon: Icon(Icons.bookmark_border, color: green600),
          )
        ],
        elevation: 0,
        backgroundColor: grey10,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 24),
            child: TextFormComponent(
                controller: controller,
                hintText: 'Cari Artikel',
                prefixIcon: Icons.search), //change tfc
          ),
          Expanded(
            child: ListView.builder(
              itemCount: article.length,
              itemBuilder: (context, index) {
                while (isBookmark.length <= index) {
                  isBookmark.add(false);
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesNavigation.articleDetailView,
                        arguments: article[index]);
                  },
                  child: ArticleCard(
                      image: article[index].image,
                      title: article[index].title,
                      profileImage: article[index].profilePicture,
                      name: article[index].name,
                      date: article[index].date,
                      onPressedIcon: () {
                        setState(() {
                          isBookmark[index] = !isBookmark[index];
                        });
                        if (isBookmark[index]) {
                          bookmarkedItem.add(article[index]);
                        } else {
                          bookmarkedItem.remove(article[index]);
                        }
                      },
                      showIcon: true,
                      isSelected: isBookmark[index],
                      selectedIcon: Icon(Icons.bookmark, color: green600),
                      unselectedIcon:
                          Icon(Icons.bookmark_add_outlined, color: green600)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
