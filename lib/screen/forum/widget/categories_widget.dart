import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForumViewModel>(
      builder: (context, viewModel, _) {
        final List<String> categories = [
          'Terbaru',
          'Terlama',
          'Populer',
        ];

        return Row(
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
        );
      },
    );
  }
}
