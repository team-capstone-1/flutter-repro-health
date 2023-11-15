import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forgot_password/widget/otp_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';
import 'package:email_otp/email_otp.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();

  @override
  void dispose() {
    otp1Controller.dispose();
    otp2Controller.dispose();
    otp3Controller.dispose();
    otp4Controller.dispose();
    otp5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final EmailOTP myauth = args['myauth'];

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.assetsLogoOtp,
                  height: 292,
                  width: 226,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Kode OTP Verifikasi',
                style: semiBold24Grey500,
              ),
              const SizedBox(height: 6),
              Text(
                'Masukan kode verifikasi yang baru saja kami kirimkan ke alamat email anda.',
                style: regular12Grey500,
              ),
              const SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpWidget(
                    otpController: otp1Controller,
                  ),
                  OtpWidget(
                    otpController: otp2Controller,
                  ),
                  OtpWidget(
                    otpController: otp3Controller,
                  ),
                  OtpWidget(
                    otpController: otp4Controller,
                  ),
                  OtpWidget(
                    otpController: otp5Controller,
                  ),
                ],
              ),
              const SizedBox(height: 48),
              ButtonComponent(
                labelText: 'Kirim',
                labelStyle: semiBold12Primary,
                backgroundColor: green500,
                onPressed: () async {
                  if (await myauth.verifyOTP(
                          otp: otp1Controller.text +
                              otp2Controller.text +
                              otp3Controller.text +
                              otp4Controller.text +
                              otp5Controller.text) ==
                      true) {
                    Navigator.pushNamed(
                      context,
                      RoutesNavigation.detailForgotPasswordView,
                    );
                    otp1Controller.clear();
                    otp2Controller.clear();
                    otp3Controller.clear();
                    otp4Controller.clear();
                    otp5Controller.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid OTP"),
                      ),
                    );
                    otp1Controller.clear();
                    otp2Controller.clear();
                    otp3Controller.clear();
                    otp4Controller.clear();
                    otp5Controller.clear();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
