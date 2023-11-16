import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  List<bool> isBookmark = [];
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
              Navigator.pushNamed(context, RoutesNavigation.bookmarkView);
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
                errortext: 'error Text',
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
                return ArticleCard(
                    image: article[index].image,
                    title: article[index].title,
                    profileImage: article[index].profilePicture,
                    name: article[index].name,
                    date: article[index].date,
                    onPressedIcon: () {
                      setState(() {
                        isBookmark[index] = !isBookmark[index];
                      });
                    },
                    isSelected: isBookmark[index],
                    selectedIcon: Icon(Icons.bookmark, color: green600),
                    unselectedIcon:
                        Icon(Icons.bookmark_border, color: green600));
              },
            ),
          )
        ],
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String image;
  final String title;
  final String profileImage;
  final String name;
  final String date;
  final VoidCallback? onPressedIcon;
  final bool isSelected;
  final Icon selectedIcon;
  final Icon unselectedIcon;
  const ArticleCard({
    required this.image,
    required this.title,
    required this.profileImage,
    required this.name,
    required this.date,
    this.onPressedIcon,
    super.key,
    required this.isSelected,
    required this.selectedIcon,
    required this.unselectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                title,
                style: semiBold12Black,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    profileImage,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    Text(name, style: medium10Black),
                    Text(
                      date,
                      style: regular8Black,
                    )
                  ],
                ),
                const SizedBox(
                  width: 120,
                ),
                IconButton(
                    onPressed: onPressedIcon,
                    icon: isSelected ? selectedIcon : unselectedIcon)
              ],
            )
          ],
        )
      ]),
    );
  }
}
