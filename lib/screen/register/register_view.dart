import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = true;

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
                Center(
                  child: Image.asset(
                    Assets.assetsLogoReprohealt,
                    height: 124,
                    width: 144,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Daftar Akun',
                  style: semiBold24Grey500,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Masukkan Informasi Pribadi Anda',
                  style: regular12Grey500,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nama',
                  style: medium14Grey500,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormComponent(
                  controller: nameController,
                  errortext: 'Nama tidak boleh kosong',
                  hintText: 'Masukkan Nama Anda',
                  prefixIcon: Icons.account_circle_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: medium14Grey500,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormComponent(
                  controller: emailController,
                  errortext: 'Email anda tidak valid!',
                  hintText: 'Masukkan Email Anda',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Kata Sandi',
                  style: medium14Grey500,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormComponent(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  errortext:
                      'Kata sandi minimal 8 karakter kombinasi huruf besar, huruf kecil, dan angka!',
                  hintText: 'Masukkan Kata Sandi Anda',
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Konfirmasi Kata Sandi',
                  style: medium14Grey500,
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormComponent(
                  controller: confirmPasswordController,
                  obscureText: !passwordVisible,
                  errortext: 'Kata sandi tidak sama!',
                  hintText: 'Konfirmasi Kata Sandi Anda',
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
                const SizedBox(
                  height: 30,
                ),
                ButtonComponent(
                  labelText: 'Daftar',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation.successRegisterView,
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
