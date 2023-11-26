import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/change_data_profile_view.dart';
import 'package:reprohealth_app/theme/theme.dart';


class ChangeProfileView extends StatefulWidget {
  const ChangeProfileView({super.key});

  @override
  State<ChangeProfileView> createState() => _ChangeProfileViewState();
}

class _ChangeProfileViewState extends State<ChangeProfileView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  String groupValue = "";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        title: Text('Ubah Data Pribadi',
        style: GoogleFonts.poppins(
          color: const Color(0xFF1E1E1E),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          )
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAFAFA),
                    ),
                ),
              ),
              ChangeDataProfile(
                controller: nameController,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16,),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ButtonWidget(
                title: "Simpan",
                onPressed: () {},
                color: green550
                ),
            ),
          )
        ],
      )
    );
  }
}