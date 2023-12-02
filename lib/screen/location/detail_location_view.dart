import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailLocationView extends StatelessWidget {
  const DetailLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green50,
      body: Center(
        child: SizedBox(
          width: 328,
          height: 344,
          child: Card(
            elevation: 0,
            color: green50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 49,
                    ),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: green500,
                      size: 36,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    child: Text(
                      'Izinkan Aplikasi Mengakses Lokasi Perangkat Ini',
                      style: medium14Grey900,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesNavigation.homeView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green50,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: green500,
                        ),
                      ),
                      minimumSize: const Size(292, 36),
                    ),
                    child: Text(
                      'Saat Aplikasi Digunakan',
                      style: regular12PrimaryGreen500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green50,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: green500,
                        ),
                      ),
                      minimumSize: const Size(292, 36),
                    ),
                    child: Text(
                      'Hanya Kali Ini',
                      style: regular12PrimaryGreen500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green50,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: green500,
                        ),
                      ),
                      minimumSize: const Size(292, 36),
                    ),
                    child: Text(
                      'Jangan Izinkan',
                      style: regular12PrimaryGreen500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
