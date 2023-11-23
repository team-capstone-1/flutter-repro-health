import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AppoinmentView extends StatefulWidget {
  const AppoinmentView({Key? key}) : super(key: key);

  @override
  _AppoinmentViewState createState() => _AppoinmentViewState();
}

class _AppoinmentViewState extends State<AppoinmentView> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green50,
      body: Center(
        child: SizedBox(
          width: 328,
          height: 392,
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
                      top: 42,
                    ),
                    child: Image.asset(
                      'assets/appoinment_isolation_mode.png',
                      width: 120,
                      height: 132,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                    ),
                    child: Text(
                      'Kami membutuhkan lokasi untuk menampilkan rekomendasi klinik di sekitar kamu',
                      style: medium14Grey900,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          isButtonPressed = !isButtonPressed;
                        },
                      );
                      Navigator.pushNamed(
                          context, RoutesNavigation.appoinmentAksesView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isButtonPressed ? primarygreen500 : green50,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: isButtonPressed ? green50 : primarygreen500,
                        ),
                      ),
                      minimumSize: const Size(192, 36),
                    ),
                    child: Text(
                      'Aktifkan Lokasi',
                      style: GoogleFonts.poppins(
                        color: isButtonPressed ? primary : primarygreen500,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    'atau',
                    style: regular10Grey400,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          isButtonPressed = !isButtonPressed;
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isButtonPressed ? green50 : primarygreen500,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: isButtonPressed ? primarygreen500 : green50,
                        ),
                      ),
                      minimumSize: const Size(192, 36),
                    ),
                    child: Text(
                      'Cari Lokasi',
                      style: GoogleFonts.poppins(
                        color: isButtonPressed ? primarygreen500 : primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
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
