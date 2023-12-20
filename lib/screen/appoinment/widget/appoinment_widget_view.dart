import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

TextEditingController searchAppoinmentController = TextEditingController();
// Location
Widget title(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: green500,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesNavigation.mapsView);
          },
          child: Text(
            'Jakarta Pusat',
            style: regular12Grey400,
          ),
        ),
      ],
    ),
  );
}

// text Field Form
Widget textFieldAppoinment() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 16,
      bottom: 24,
      left: 16,
      right: 16,
    ),
    child: TextFormComponent(
      controller: searchAppoinmentController,
      hintText: 'Cari Spesialis dan Klinik',
      hinstStyle: regular14Grey400,
      prefixIcon: Icons.search,
    ),
  );
}
