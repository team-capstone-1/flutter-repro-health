import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
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

  bool _validateEmail(String email) {
    final emailPattern =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailPattern.hasMatch(email)) {
      return false;
    }
    return true;
  }

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: Image.asset(Assets.assetsLupaPassword, width: 260, height: 216,)),
                const SizedBox(height: 68),
                Text(
                  'Lupa Kata Sandi ?',
                  style: semiBold24Grey500,
                ),
                const SizedBox(height: 6),
                Text(
                  'Jangan khawatir ! Silahkan masukan alamat email yang tertaut pada akun anda.',
                  style: regular12Grey500,
                ),
                const SizedBox(height: 32),
                Text(
                  'Email',
                  style: medium14Grey400,
                ),
                const SizedBox(height: 6),
                TextFormComponent(
                  controller: emailController,
                  hintText: 'Masukkan Email Anda',
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !_validateEmail(value)) {
                      return 'Email anda tidak valid! contoh: johndoe@gmail.com';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ButtonComponent(
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
                    var template = '''
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Email Template</title>
            
              <style>
                  /* Tambahkan gaya CSS sesuai kebutuhan Anda */
                  body {
              font-family: 'Arial', sans-serif;
                  }
            
                  .container {
              max-width: 600px;
              margin: auto;
              padding: 20px;
              border: 1px solid #ccc;
              border-radius: 10px;
                  }
            
                  .header {
              text-align: center;
                  }
            
                  .otp-code {
              font-size: 24px;
              font-weight: bold;
              color: #007bff;
                  }
            
                  .footer {
              margin-top: 20px;
              text-align: center;
              color: #555;
                  }
              </style>
            </head>
            <body>
              <div class="container">
                  <div class="header">
              <h2>{{app_name}} Bantuan Reset Password Akun Anda</h2>
                  </div>
                  <p>Halo ${emailController.text},</p>
                  <p>Kami telah menerima permintaan untuk mereset password akun Anda. Untuk melanjutkan proses reset, berikut adalah kode OTP Anda:</p>
                  <div class="otp-code">
              <p>Kode OTP: {{otp}}</p>
                  </div>
                  <p>Silakan gunakan kode ini untuk mereset password akun Anda.</p>
                  <p>Jika Anda tidak mengajukan permintaan ini, mohon abaikan email ini. Keamanan akun Anda adalah prioritas kami, jadi pastikan untuk tidak memberikan kode ini kepada siapa pun.</p>
                  <p>Terima kasih atas perhatiannya.</p>
                  <p>Hormat kami,<br>ReproHealth</p>
              </div>
            </body>
            </html>
            ''';
                    myauth.setTemplate(render: template);
            
                    if (_formKey.currentState!.validate() &&
                        await myauth.sendOTP() == true) {
                      Navigator.pushNamed(
                        context,
                        RoutesNavigation.otpView,
                        arguments: {
                          'myauth': myauth,
                        },
                      );
                      emailController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Oops, OTP send failed"),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
