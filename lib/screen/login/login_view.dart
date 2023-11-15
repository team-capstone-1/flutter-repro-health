import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Assets.assetsLogoReprohealt,
                  height: 153,
                  width: 144,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 6,
                ),
                child: Text(
                  'Masuk',
                  style: semiBold24Grey400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                ),
                child: Text(
                  'Masuk Untuk Menggunakan Aplikasi',
                  style: regular10Grey300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  'Email',
                  style: medium14Grey400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
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
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 16,
                ),
                child: Text(
                  'Kata Sandi',
                  style: medium14Grey400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                child: TextFormComponent(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  errortext:
                      'Kata sandi salah, silahkan masukkan kata sandi yang benar',
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
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
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
                          'Ingat Saya',
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 48,
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                child: ButtonComponent(
                  labelText: 'Masuk',
                  labelStyle: semiBold12Primary,
                  backgroundColor: green500,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      emailController.clear();
                      passwordController.clear();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation.homeView,
                        (route) => false,
                      );
                    }
                  },
                ),
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
                      Navigator.pushNamed(context, RoutesNavigation.registerView);
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
    );
  }
}
