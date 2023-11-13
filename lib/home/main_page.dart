import 'package:capstone_flutter_test/items/navbar_item.dart';
import 'package:capstone_flutter_test/page/appoinment_page.dart';
import 'package:capstone_flutter_test/page/article_page.dart';
import 'package:capstone_flutter_test/page/forum_page.dart';
import 'package:capstone_flutter_test/page/profile_page.dart';
import 'package:capstone_flutter_test/page/riwayat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentIndexProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: customBottomNav(),
        body: Consumer<CurrentIndexProvider>(
          builder: (context, currentIndexProvider, child) {
            int currentIndex = currentIndexProvider.currentIndex;
            return IndexedStack(
              index: currentIndex,
              children: const <Widget>[
                AppoinmentPage(),
                ArticlePage(),
                ForumPage(),
                RiwayatPage(),
                ProfilePage(),
              ],
            );
          },
        ),
      ),
    );
  }
}
