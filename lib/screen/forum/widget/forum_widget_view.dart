import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
    padding: const EdgeInsets.only(
      right: 16,
      left: 16,
      top: 5,
    ),
    child: Text(
      'Cari dan Tanyakan Keluhanmu Disini',
      style: medium14Grey900,
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

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((kategori) {
              final isSelected = viewModel.kategoriListMap.contains(kategori);
              return Row(
                children: [
                  FilterChip(
                    backgroundColor: isSelected ? green500 : Colors.white,
                    label: Text(
                      kategori,
                      style: GoogleFonts.poppins(
                        color: isSelected ? green50 : green500,
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
                        color: isSelected ? green800 : green500,
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
      );
    },
  );
}
