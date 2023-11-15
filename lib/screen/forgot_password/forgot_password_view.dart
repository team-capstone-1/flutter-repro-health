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
                child: Image.asset(Assets.assetsLupaPassword),
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
            <h2>Kode OTP Anda</h2>
        </div>
        <div class="otp-code">
            <p>Thank you for choosing {{app_name}}. Your OTP is {{otp}}.</p>
        </div>
        <div class="footer">
            <p>Jangan berikan kode ini kepada siapa pun. Kode ini berlaku untuk penggunaan sekali.</p>
        </div>
    </div>
</body>
</html>
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
