import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import 'package:reprohealth_app/theme/theme.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            "Pilih Jadwal",
            style: semiBold14Grey500,
          ),
          const SizedBox(width: 8),
          JustTheTooltip(
            content: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Kamu hanya dapat mengganti jadwal sebanyak 1 kali setelah 1 minggu melakukan pemesanan janji temu',
              ),
            ),
            child: const Icon(
              Icons.info_outline,
            ),
          )
        ],
      ),
    );
  }
}
