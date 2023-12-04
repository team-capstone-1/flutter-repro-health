import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class LocationAppoinmentWidget extends StatelessWidget {
  const LocationAppoinmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}
