import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/screen/article/widgets/article_card.dart';
import 'package:reprohealth_app/services/article_services/article_Services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  List<bool> isBookmark = [];
  List<ArticleModels> bookmarkedItem = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 16, right: 16, bottom: 24),
              child: TextFormComponent(
                controller: controller,
                hintText: 'Cari Artikel',
                hinstStyle: regular14Grey400,
                prefixIcon: Icons.search,
                onChanged: (query) {
                  setState(() {});
                },
              ),
            ),
            FutureBuilder<List<ArticleModels>>(
              future: ArticleServices().getArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text(
                    'Tidak ada artikel',
                  ));
                } else {
                  List<ArticleModels> articles = snapshot.data!;
                  isBookmark = List.generate(articles.length, (index) => false);

                  String query = controller.text.toLowerCase();
                  List<ArticleModels> filteredArticles = articles
                      .where((articles) =>
                          articles.title.toLowerCase().contains(query))
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        while (isBookmark.length <= index) {
                          isBookmark.add(false);
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesNavigation.articleDetailView,
                                arguments: article,
                              );
                            },
                            child: Expanded(
                              child: ArticleCard(
                                image: article.image,
                                title: article.title,
                                doctorImage: article.doctor?.profileImage ?? '',
                                doctorName: article.doctor?.name ?? '',
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
                                selectedIcon:
                                    Icon(Icons.bookmark, color: green600),
                                unselectedIcon: Icon(
                                  Icons.bookmark_add_outlined,
                                  color: green600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ));
  }
}
