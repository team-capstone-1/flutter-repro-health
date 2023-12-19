import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class LocationAppoinmentWidget extends StatelessWidget {
  const LocationAppoinmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppoinmentViewModel>(
      builder: (context, appoinmentViewModel, child) {
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
                  appoinmentViewModel.location?.forEach(
                    (element) {
                      if (kDebugMode) {
                        print(element);
                      }
                    },
                  );
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
      },
    );
  }
}
