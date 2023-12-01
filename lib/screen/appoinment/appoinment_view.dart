import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/screen/appoinment/widget/klinik_appoinment_widget.dart';
import 'package:reprohealth_app/screen/appoinment/widget/location_appoinment_view.dart';
import 'package:reprohealth_app/screen/appoinment/widget/spesialis_appointment_widget.dart';
import 'package:reprohealth_app/screen/appoinment/widget/text_field_appointment_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AppoinmentView extends StatelessWidget {
  const AppoinmentView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AppoinmentViewModel>(context, listen: false)
        .filteredDasboardKlinikData
        .addAll(klinikModelsData);
    Provider.of<AppoinmentViewModel>(context, listen: false)
        .filteredDasboardSpesialisData
        .addAll(spesialisModelsData);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 8,
            bottom: 8,
          ),
          child: Image(
            width: 129.0,
            height: 40.0,
            image: AssetImage('assets/logo_reproHealth_appoinment.png'),
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: IconButton(
              color: primarygreen500,
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: grey10,
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LocationAppoinmentWidget(),
            TextFieldAppointmentWidget(),
            SpesialisAppoinmentWidget(),
            KlinikAppoinmentWidget(),
          ],
        ),
      ),
    );
  }
}
