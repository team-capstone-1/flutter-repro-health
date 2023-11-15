import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/models/forum_models.dart';
import 'package:reprohealth_app/screen/tabbar/forum_tabbar_lihat_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForumWidgetView with ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  List<String> kategoriListMap = [];

  String _searchText = '';

  String get searchText => _searchText;

  void onSearchChanged(String value) {
    _searchText = value;
    notifyListeners();
  }

  void onFloatingActionButtonClicked() {}

  void toggleCategory(String kategori) {
    if (kategoriListMap.contains(kategori)) {
      kategoriListMap.remove(kategori);
    } else {
      kategoriListMap.add(kategori);
    }
    notifyListeners();
  }
}

Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Forum',
              style: semiBold16Green700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cari dan Tanyakan Keluhanmu Disini',
              style: medium14Grey900,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildSearchBar(ForumWidgetView viewModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 328.0,
            height: 48.0,
            decoration: BoxDecoration(
              color: grey10,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: grey900),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    color: grey400,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: viewModel.searchController,
                    onChanged: viewModel.onSearchChanged,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                        12,
                        16,
                        16,
                        12,
                      ),
                      border: InputBorder.none,
                      hintText: 'Cari Forum Diskusi..',
                      hintStyle: regular14Grey400,
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildCategories(BuildContext context) {
  return Consumer<ForumWidgetView>(
    builder: (context, viewModel, _) {
      final List<String> categories = [
        'Terbaru',
        'Terlama',
        'Populer',
      ];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((kategori) {
                final isSelected = viewModel.kategoriListMap.contains(kategori);
                return Row(
                  children: [
                    FilterChip(
                      backgroundColor:
                          isSelected ? green500 : Colors.white,
                      label: Text(
                        kategori,
                        style: GoogleFonts.poppins(
                          color: isSelected
                              ? green50
                              : green500,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      onSelected: (selected) {
                        viewModel.toggleCategory(kategori);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isSelected
                              ? green800
                              : green500,
                          width: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  );
}

Widget buildTabbar() {
  return Container(
    margin: const EdgeInsets.only(),
    width: double.infinity,
    height: 500,
    child: DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            child: TabBar(
              labelColor: grey900,
              unselectedLabelColor: grey400,
              labelStyle: regular14Grey900,
              indicatorWeight: 2,
              indicatorColor: green800,
              tabs: const [
                Tab(
                  text: 'Lihat Forum',
                ),
                Tab(
                  text: 'Pertanyaan Saya',
                )
              ],
            ),
          ),
          const Divider(
            thickness: 4,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ForumTabbarLihatView(forum: myForum);
                          },
                        ),
                        Container(
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
