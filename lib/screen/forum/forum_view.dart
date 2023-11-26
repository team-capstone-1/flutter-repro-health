import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/forum_models.dart';
import 'package:reprohealth_app/screen/forum/widget/forum_widget_view.dart';
import 'package:reprohealth_app/screen/forum/widget/lihat_forum_widget.dart';
import 'package:reprohealth_app/screen/forum/widget/pertanyaan_saya_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForumView extends StatelessWidget {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return ChangeNotifierProvider(
      create: (_) => ForumWidgetView(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Forum',
              style: semiBold16Green700,
            ),
            elevation: 0,
            backgroundColor: grey10,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: TextFormComponent(
                  controller: searchController,
                  hintText: 'Cari Forum Diskusi...',
                  prefixIcon: Icons.search,
                ),
              ),
              buildCategories(context),
              TabBar(
                labelStyle: medium14Grey400,
                labelColor: grey900,
                unselectedLabelColor: grey400,
                tabs: [
                  Tab(
                    child: Text(
                      'Lihat Forum',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Pertanyaan Saya',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return LihatForumWidget(forum: forumLihat);
                      },
                    ),
                    ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return PertanyaanSayaWidget(forum: forumPertanyaan);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: green500, width: 1.0),
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    // First FAB action
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.edit,
                    color: green500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 56.0,
                height: 56.0,
                child: FloatingActionButton(
                  onPressed: () {
                    // Second FAB action
                  },
                  backgroundColor: green500,
                  child: const Icon(Icons.message_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
