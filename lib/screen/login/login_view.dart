import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/login/view_model/login_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    Provider.of<LoginViewModels>(context, listen: false).autoLogin();
    super.initState();
  }

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
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesNavigation.choiceView,
              (route) => false,
            );
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Consumer<LoginViewModels>(
              builder: (context, loginViewModels, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.assetsLogoReprohealth,
                        height: 153,
                        width: 144,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Masuk',
                      style: semiBold24Grey400,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Masuk Untuk Menggunakan Aplikasi',
                      style: regular12Grey500,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Email',
                      style: medium14Grey400,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormComponent(
                      controller: loginViewModels.emailController,
                      hintText: 'Masukkan Email Anda',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !loginViewModels.validateEmail(value)) {
                          return 'Email anda tidak valid! contoh: johndoe@gmail.com';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Kata Sandi',
                      style: medium14Grey400,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormComponent(
                      controller: loginViewModels.passwordController,
                      obscureText: !loginViewModels.passwordVisible,
                      hintText: 'Kata Sandi',
                      hinstStyle: regular12Grey100,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginViewModels.togglePassword();
                        },
                        icon: Icon(
                          loginViewModels.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: grey200,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi salah, silahkan masukkan kata sandi yang benar';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: loginViewModels.toggleRememberMe,
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 4,
                                  right: 12,
                                ),
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: loginViewModels.rememberMe
                                      ? green500
                                      : null,
                                  borderRadius: BorderRadius.circular(6),
                                  border: !loginViewModels.rememberMe
                                      ? Border.all(
                                          width: 2,
                                          color: grey300,
                                        )
                                      : null,
                                ),
                                child: loginViewModels.rememberMe
                                    ? Center(
                                        child: Icon(
                                          Icons.check,
                                          color: grey10,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            Text(
                              'Ingatkan Saya',
                              style: regular10Grey300,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesNavigation.forgotPasswordView,
                            );
                          },
                          child: Text(
                            'Lupa Kata Sandi ?',
                            style: regular10Green500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 54,
                    ),
                    ButtonComponent(
                      labelText: loginViewModels.isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Masuk",
                              style: semiBold12Primary,
                              textAlign: TextAlign.center,
                            ),
                      backgroundColor: green500,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginViewModels.loginAccount(context: context);
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum Mempunyai Akun?',
                          style: regular10Grey400,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesNavigation.registerView,
                            );
                          },
                          child: Text(
                            'Daftar',
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
      ),
    );
  }
}
