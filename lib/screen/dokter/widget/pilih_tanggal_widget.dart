import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_tanggal_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PilihTanggalWidget extends StatelessWidget {
  const PilihTanggalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PilihTanggalViewModel>(
      builder: (context, pilihTanggalViewModel, child) {
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
                DateFormat('dd/MM/yyyy').format(pilihTanggalViewModel.dueDate),
              ),
              GestureDetector(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: pilihTanggalViewModel.currentDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050),
                  );
                  if (selectedDate != null) {
                    pilihTanggalViewModel.dueDate = selectedDate;
                    pilihTanggalViewModel.currentDate = selectedDate;
                  }
                },
                child: Icon(
                  Icons.calendar_month,
                  color: primarygreen500,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
