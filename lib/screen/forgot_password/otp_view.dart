import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/forgot_password/view_model/otp_view_model.dart';
import 'package:reprohealth_app/screen/forgot_password/widget/otp_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final String email = args;

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
          child: Consumer<OtpViewModel>(
            builder: (context, otpViewModel, child) {
              return Column(
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
                        otpController: otpViewModel.otp1Controller,
                      ),
                      OtpWidget(
                        otpController: otpViewModel.otp2Controller,
                      ),
                      OtpWidget(
                        otpController: otpViewModel.otp3Controller,
                      ),
                      OtpWidget(
                        otpController: otpViewModel.otp4Controller,
                      ),
                      OtpWidget(
                        otpController: otpViewModel.otp5Controller,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  ButtonComponent(
                    labelText: otpViewModel.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "Kirim",
                            style: semiBold12Primary,
                            textAlign: TextAlign.center,
                          ),
                    backgroundColor: green500,
                    onPressed: () {
                      otpViewModel.validateOtp(context: context, email: email);
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak Menerima Kode ? ',
                        style: regular10Grey400,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          otpViewModel.sendEmail(
                            context: context,
                            email: email,
                          );
                        },
                        child: Text(
                          'Kirim Ulang',
                          style: regular10Green500,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
