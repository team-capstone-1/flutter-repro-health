import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
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

  bool _validatePassword(String password) {
    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

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
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buat Kata Sandi Baru',
                  style: semiBold24Grey500,
                ),
                const SizedBox(height: 6),
                Text(
                  'Kata sandi baru anda harus unik dari yang digunakan sebelumnya',
                  style: regular12Grey500,
                ),
                const SizedBox(height: 12),
                Text(
                  'Kata Sandi Baru',
                  style: medium14Grey400,
                ),
                const SizedBox(height: 6),
                TextFormComponent(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  hintText: 'Kata Sandi',
                  hinstStyle: regular12Grey100,
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
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !_validatePassword(value)) {
                      return 'Kata sandi minimal 8 karakter kombinasi huruf besar, huruf kecil, dan angka!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Konfirmasi Kata Sandi',
                  style: medium14Grey400,
                ),
                const SizedBox(height: 6),
                TextFormComponent(
                  controller: confirmPasswordController,
                  obscureText: !passwordVisible,
                  hintText: 'konfirmasi Kata Sandi',
                  hinstStyle: regular12Grey100,
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
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != passwordController.text) {
                      return 'Kata sandi tidak sama!!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 72),
                ButtonComponent(
                  labelText: 'Kirim',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation.loginView,
                        (route) => false,
                      );
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
