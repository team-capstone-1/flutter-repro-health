import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/navbar_component.dart';
import 'package:reprohealth_app/screen/appoinment/appoinment_view.dart';
import 'package:reprohealth_app/screen/article/article_view.dart';
import 'package:reprohealth_app/screen/forum/forum_view.dart';
import 'package:reprohealth_app/screen/home/home_view_models.dart';
import 'package:reprohealth_app/screen/profile/profile_view.dart';
import 'package:reprohealth_app/screen/riwayat/riwayat_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey10,
      bottomNavigationBar: customBottomNav(),
      body: Consumer<HomeViewModels>(
        builder: (context, currentIndexProvider, child) {
          int currentIndex = currentIndexProvider.currentIndex;
          return IndexedStack(
            index: currentIndex,
            children: const <Widget>[
              AppoinmentView(),
              ArticleView(),
              ForumView(),
              RiwayatView(),
              ProfileView(),
            ],
          );
        },
      ),
    );
  }
}
