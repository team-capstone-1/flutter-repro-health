import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/screen/appoinment/widget/appoinment_widget_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AppoinmentDasboardView extends StatefulWidget {
  const AppoinmentDasboardView({super.key});

  @override
  State<AppoinmentDasboardView> createState() => _AppoinmentDasboardViewState();
}

class _AppoinmentDasboardViewState extends State<AppoinmentDasboardView> {
  @override
  void initState() {
    super.initState();
    filteredDasboardKlinikData.addAll(klinikDasboardModelsData);
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            title(context),
            textFieldAppoinment(),
            spesialisAppoinment(context),
            klinikAppoinment(context),
          ],
        ),
      ),
    );
  }
}
