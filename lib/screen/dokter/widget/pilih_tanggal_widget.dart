import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PilihTanggalWidget extends StatelessWidget {
  const PilihTanggalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JanjiTemuViewModel>(
      builder: (context, janjiTemuViewModel, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: grey500),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('dd/MM/yyyy').format(janjiTemuViewModel.dueDate),
              ),
              GestureDetector(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: janjiTemuViewModel.currentDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (selectedDate != null) {
                    janjiTemuViewModel.dueDate = selectedDate;
                    janjiTemuViewModel.currentDate = selectedDate;
                  }
                },
                child: Icon(
                  Icons.calendar_month,
                  color: green500,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
