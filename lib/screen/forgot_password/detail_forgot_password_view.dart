import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/screen/forgot_password/view_model/detail_forgot_password_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailForgotPasswordView extends StatefulWidget {
  const DetailForgotPasswordView({super.key});

  @override
  State<DetailForgotPasswordView> createState() =>
      _DetailForgotPasswordViewState();
}

class _DetailForgotPasswordViewState extends State<DetailForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    // GET TOKEN BY RESPONSE OTP VIEW
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final String token = args;

    final formKey = GlobalKey<FormState>();
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
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Consumer<DetailForgotPasswordViewModel>(
              builder: (context, detailForgotPasswordViewModel, child) {
                return Column(
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
                      controller:
                          detailForgotPasswordViewModel.passwordController,
                      obscureText:
                          !detailForgotPasswordViewModel.passwordVisible,
                      hintText: 'Kata Sandi',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          detailForgotPasswordViewModel.togglePassword();
                        },
                        icon: Icon(
                          detailForgotPasswordViewModel.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey200,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !detailForgotPasswordViewModel
                                .validatePassword(value)) {
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
                      controller: detailForgotPasswordViewModel
                          .confirmPasswordController,
                      obscureText:
                          !detailForgotPasswordViewModel.passwordVisible,
                      hintText: 'konfirmasi Kata Sandi',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          detailForgotPasswordViewModel.togglePassword();
                        },
                        icon: Icon(
                          detailForgotPasswordViewModel.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey200,
                        ),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value !=
                                detailForgotPasswordViewModel
                                    .passwordController.text) {
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
                        if (formKey.currentState!.validate()) {
                          detailForgotPasswordViewModel.changePassword(
                            context: context,
                            token: token,
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
