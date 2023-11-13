import 'package:capstone_flutter_test/items/forum_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForumPageViewModel(),
      child: Scaffold(
        body: Consumer<ForumPageViewModel>(
          builder: (context, viewModel, _) {
            return ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                buildHeader(),
                const SizedBox(height: 24),
                buildSearchBar(viewModel),
                const SizedBox(height: 24),
                buildCategories(context),
                const SizedBox(height: 24),
                buildTabbar(),
                const Divider(
                  thickness: 4,
                )
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff14C6A4),
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
