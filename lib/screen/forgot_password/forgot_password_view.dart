import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/screen/forgot_password/otp_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 35,
                  right: 65,
                  bottom: 68,
                ),
                child: Image.asset('assets/lupa_password.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Text(
                  'Lupa Kata Sandi ?',
                  style: semiBold24Grey500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                ),
                child: Text(
                  'Jangan khawatir ! Silahkan masukan alamat email yang tertaut pada akun anda.',
                  style: regular10Grey500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 6,
                ),
                child: Text(
                  'Email',
                  style: medium14Grey400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 48,
                ),
                child: TextFormComponent(
                  controller: emailController,
                  errortext:
                      'Email anda tidak valid! contoh: johndoe@gmail.com',
                  hintText: 'Masukkan Email Anda',
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: ButtonComponent(
                  labelText: 'Kirim',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () async {
                    myauth.setConfig(
                      appEmail: "muhammadalbert16@gmail.com",
                      appName: "Email OTP",
                      userEmail: emailController.text,
                      otpLength: 5,
                      otpType: OTPType.digitsOnly,
                    );
                    if (_formKey.currentState!.validate() &&
                        await myauth.sendOTP() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpView(
                            myauth: myauth,
                          ),
                        ),
                      );
                      emailController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Oops, OTP send failed"),
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
