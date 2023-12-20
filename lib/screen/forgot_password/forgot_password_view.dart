import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Consumer<ForgotPasswordViewModel>(
              builder: (context, forgotPasswordViewModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Center(
                        child: Image.asset(
                      Assets.assetsLupaPassword,
                      width: 260,
                      height: 216,
                    )),
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
                      controller: forgotPasswordViewModel.emailController,
                      hintText: 'Masukkan Email Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !forgotPasswordViewModel.validateEmail(value)) {
                          return 'Email anda tidak valid! contoh: johndoe@gmail.com';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ButtonComponent(
                      labelText: forgotPasswordViewModel.isLoading == true
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
                        if (formKey.currentState!.validate()) {
                          forgotPasswordViewModel.sendEmail(
                            context: context,
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
