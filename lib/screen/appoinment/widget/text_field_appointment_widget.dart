import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class TextFieldAppointmentWidget extends StatelessWidget {
  const TextFieldAppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 24,
        left: 16,
        right: 16,
      ),
      child: Consumer<AppoinmentViewModel>(
        builder: (context, appoinmentViewModel, child) {
          return TextFormComponent(
            controller: appoinmentViewModel.searchAppoinmentController,
            hintText: 'Cari Spesialis, Klinik, Dokter',
            hinstStyle: regular14Grey400,
            prefixIcon: Icons.search,
            onChanged: (query) {
              appoinmentViewModel.filterSearchKlinik(query);
              appoinmentViewModel.filterSearchSpesialis(query);
            },
          );
        },
      ),
    );
  }
}
