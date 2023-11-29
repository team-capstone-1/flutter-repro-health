import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/button_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/snackbar_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {

final TextEditingController oldPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
bool passwordVisible = true;
bool passwordVisible2 = true;
final _formKey = GlobalKey<FormState>();

@override
  void initState() {
    passwordVisible = false;
    passwordVisible2 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9E9E9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: grey10,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text("Ubah Kata Sandi",
        style: semiBold16Primary4,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 335,
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text("Silahkan masukkan kata sandi baru",
                style: semiBold14Grey500,
                ),
                const SizedBox(height: 16),
                Text("Kata Sandi Lama",
                style: medium12Grey500,
                ),
                const SizedBox(height: 4),
                TextFormComponent(
                  controller: oldPasswordController,
                  obscureText: !passwordVisible,
                  hintText: 'Kata sandi lama',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(
                      passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                      color: grey200,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text("Konfirmasi Kata Sandi",
                  style: medium12Grey500,
                ),
                const SizedBox(height: 4),
                TextFormComponent(
                  controller: newPasswordController,
                  obscureText: !passwordVisible2,
                  hintText: 'Kata sandi baru',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible2 = !passwordVisible2;
                      });
                    },
                    icon: Icon(
                      passwordVisible2
                        ? Icons.visibility
                        : Icons.visibility_off,
                      color: grey200,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ButtonWidget(
                    title: "Ubah",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (oldPasswordController.text == newPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackBar(
                                contentText: 'Kata sandi berhasil diubah!',
                                backgroundColor: positive,
                              ),
                            );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackBar(
                                contentText: 'Kata sandi lama yang dimasukkan tidak sesuai!',
                                backgroundColor: negative ,
                              ),
                            );
                        }
                      }
                    },
                    color: green550
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}