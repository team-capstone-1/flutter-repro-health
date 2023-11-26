import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/bottom_sheet_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text("Profil Saya",
        style: semiBold16Primary4,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(
              context, RoutesNavigation.changeProfileView
              ),
            child: Text("Ubah",
            style: GoogleFonts.poppins(
              color: green550,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              )
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 92,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                          width: 60,
                          height: 60,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFB9B9B9),
                            shape: OvalBorder(),
                            ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                top: 30,
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: IconButton(
                                    onPressed: () {
                                      BottomSheetWidget.bottomSheet(context);
                                    }, 
                                    icon: Icon(Icons.camera_alt_outlined,
                                    color: green550,
                                    )
                                    ),
                                )
                                )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            Text("Qonita Lutfiah",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1E1E1E),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              )
                            ),
                        const SizedBox(
                          height: 8,
                        ),
                            Text("+628188882023",
                            style: regular14Grey200
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 1),
            Container(
              width: double.infinity,
              height: 224,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tanggal Lahir",
                      style: regular12Grey200,
                      
                      ),
                      Text("17 Desember 2000",
                      style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 8,),
                      Text("Jenis Kelamin",
                      style: regular12Grey200,
                      ),
                      Text("Laki - laki",
                      style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 8,),
                       Text("Berat (kg)",
                      style: regular12Grey200,
                      ),
                      Text("70",
                      style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 8,),
                       Text("Tinggi (cm)",
                      style: regular12Grey200,
                      ),
                      Text("170",
                      style: semiBold14Grey500,
                      ),
                      const SizedBox(height: 8,),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
      );
  }
}