import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/services/auth_services/auth_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool passwordVisible = true;

  void toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  bool _validateEmail(String email) {
    final emailPattern =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9^`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailPattern.hasMatch(email)) {
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
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Assets.assetsLogoReproHealth,
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
                  controller: passwordController,
                  obscureText: !passwordVisible,
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
                          onTap: toggleRememberMe,
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 4,
                              right: 12,
                            ),
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                              color: rememberMe ? green500 : null,
                              borderRadius: BorderRadius.circular(6),
                              border: !rememberMe
                                  ? Border.all(
                                      width: 2,
                                      color: grey300,
                                    )
                                  : null,
                            ),
                            child: rememberMe
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
                  labelText: 'Masuk',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthServices().authLogin(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context,
                      );
                      emailController.clear();
                      passwordController.clear();
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
            ),
          ),
        ),
      ),
    );
  }
}
