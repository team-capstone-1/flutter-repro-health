import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/page/forum/forum_widget_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForumView extends StatelessWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForumWidgetView(),
      child: Scaffold(
        body: Consumer<ForumWidgetView>(
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
          backgroundColor: green500,
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
