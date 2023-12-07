import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/register/view_model/register_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
      body: Consumer<RegisterViewModels>(
        builder: (context, registerViewModel, child) {
          return Form(
            key: registerViewModel.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.assetsLogoReprohealth,
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
                      controller: registerViewModel.nameController,
                      hintText: 'Masukkan Nama Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.account_circle_outlined,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !registerViewModel.validateName(value)) {
                          return 'Nama tidak boleh kosong, diawali dengan huruf besar dan minimal 3 huruf';
                        }
                        return null;
                      },
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
                      controller: registerViewModel.emailController,
                      hintText: 'Masukkan Email Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !registerViewModel.validateEmail(value)) {
                          return 'Email anda tidak valid! contoh: johndoe@gmail.com';
                        }
                        return null;
                      },
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
                      controller: registerViewModel.passwordController,
                      obscureText: !registerViewModel.passwordVisible,
                      hintText: 'Masukkan Kata Sandi Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          registerViewModel.isPasswordVisible();
                        },
                        icon: Icon(
                          registerViewModel.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey200,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !registerViewModel.validatePassword(value)) {
                          return 'Kata sandi minimal 8 karakter kombinasi huruf besar, huruf kecil, dan angka!';
                        }
                        return null;
                      },
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
                      controller: registerViewModel.confirmPasswordController,
                      obscureText: !registerViewModel.passwordVisible,
                      hintText: 'Konfirmasi Kata Sandi Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          registerViewModel.isPasswordVisible();
                        },
                        icon: Icon(
                          registerViewModel.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey200,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value !=
                                registerViewModel.passwordController.text) {
                          return 'Kata sandi tidak sama!!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonComponent(
                      labelText: 'Daftar',
                      labelStyle: semiBold12Primary,
                      backgroundColor: green500,
                      onPressed: () {
                        if (registerViewModel.formKey.currentState!
                            .validate()) {
                          registerViewModel.registerAccount(context: context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
