import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/screen/login/login_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailForgotPasswordView extends StatefulWidget {
  const DetailForgotPasswordView({super.key});

  @override
  State<DetailForgotPasswordView> createState() =>
      _DetailForgotPasswordViewState();
}

class _DetailForgotPasswordViewState extends State<DetailForgotPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    passwordVisible = false;
    super.initState();
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 6),
                  child: Text(
                    'Buat Kata Sandi Baru',
                    style: semiBold24Grey500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: Text(
                    'Kata sandi baru anda harus unik dari yang digunakan sebelumnya',
                    style: regular12Grey500,
                  ),
                ),
                Text(
                  'Kata Sandi Baru',
                  style: medium14Grey400,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: TextFormComponent(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    errortext:
                        'Kata sandi tidak boleh kosong, silahkan masukkan kata sandi anda',
                    hintText: 'Kata Sandi',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: grey200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                Text(
                  'Konfirmasi Kata Sandi',
                  style: medium14Grey400,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: TextFormComponent(
                    controller: confirmPasswordController,
                    obscureText: !passwordVisible,
                    errortext:
                        'Kata sandi tidak boleh kosong, silahkan masukkan kata sandi anda',
                    hintText: 'konfirmasi Kata Sandi',
                    prefixIcon: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: grey200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 42,
                  ),
                  child: ButtonComponent(
                    labelText: 'Kirim',
                    labelStyle: semiBold12Primary,
                    backgroundColor: green500,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
