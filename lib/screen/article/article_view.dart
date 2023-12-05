import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/screen/article/widgets/article_card.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  List<bool> isBookmark = [];
  List<ArticleModels> bookmarkedItem = [];
  late Future<List<ArticleModels>> articlesFuture;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    articlesFuture = ArticleService(Dio()).getArticles();
  }

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
      body: FutureBuilder<List<ArticleModels>>(
        future: articlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<ArticleModels> articles = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, left: 16, right: 16, bottom: 24),
                  child: TextFormComponent(
                    controller: controller,
                    hintText: 'Cari Artikel',
                    hinstStyle: regular14Grey400,
                    prefixIcon: Icons.search,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      while (isBookmark.length <= index) {
                        isBookmark.add(false);
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesNavigation.articleDetailView,
                              arguments: article);
                        },
                        child: ArticleCard(
                            image: article.image,
                            title: article.title,
                            profileImage: article.doctor.image,
                            name: article.doctor.name,
                            date: article.date,
                            onPressedIcon: () {
                              setState(() {
                                isBookmark[index] = !isBookmark[index];
                              });
                              if (isBookmark[index]) {
                                bookmarkedItem.add(article);
                              } else {
                                bookmarkedItem.remove(article);
                              }
                            },
                            showIcon: true,
                            isSelected: isBookmark[index],
                            selectedIcon: Icon(Icons.bookmark, color: green600),
                            unselectedIcon: Icon(Icons.bookmark_add_outlined,
                                color: green600)),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
