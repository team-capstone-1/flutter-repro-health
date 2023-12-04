import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forum/view_model/forum_view_model.dart';
import 'package:reprohealth_app/screen/forum/widget/text_form_widget.dart';
import 'package:reprohealth_app/services/forum_services/forum_services.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CreateForumView extends StatefulWidget {
  const CreateForumView({super.key});

  @override
  State<CreateForumView> createState() => _CreateForumViewState();
}

class _CreateForumViewState extends State<CreateForumView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool rememberMe = false;
  Color buttonColor = grey100;

  void updateButtonColor() {
    setState(
      () {
        buttonColor =
            (titleController.text.isEmpty || messageController.text.isEmpty)
                ? grey100
                : green500;
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Yakin ingin membatalkan forum?',
              style: semiBold14Black,
            ),
          ),
          content: Text(
            'Jika Anda meninggalkan halaman ini, keluhan yang sedang Anda buat akan hilang dan tidak dapat dikembalikan lagi.',
            style: regular12Grey300,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            SizedBox(
              height: 36,
              width: 124,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: negative,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Ya, Batal', style: semiBold12Grey10),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesNavigation.homeView,
                    (route) => false,
                  );
                },
              ),
            ),
            SizedBox(
              height: 36,
              width: 124,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Tidak', style: semiBold12Grey10),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    titleController.addListener(updateButtonColor);
    messageController.addListener(updateButtonColor);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _showMyDialog,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Kembali ke Forum',
          style: semiBold16Grey700,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFormWidget(
                  controller: titleController,
                  hintText: "Masukkan Judul",
                  hinstStyle: regular14Grey400,
                  maxLength: 30,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Maximum 30 Karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                TextFormWidget(
                  controller: messageController,
                  hintText:
                      """Apa yang ingin kamu tanyakan atau                    ceritakan tentang kesehatan reproduksimu?
                    
Tulis pertanyaanmu di sini""",
                  hinstStyle: regular14Grey400,
                  textInputType: TextInputType.multiline,
                  maxLines: 18,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
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
                                  color: grey900,
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
                      'Kirim sebagai anonim',
                      style: medium12Grey400,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Consumer<ForumViewModel>(
                  builder: (context, forumViewModel, child) {
                    return ButtonComponent(
                                  labelText: "Kirim",
                                  labelStyle: semiBold12Grey10,
                                  backgroundColor: buttonColor,
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      ForumServices().createForum(
                                        patientId: forumViewModel.profileList?.response?.first.id ?? '',
                                        title: titleController.text,
                                        content: messageController.text,
                                        anonymous: rememberMe,
                                        context: context,
                                      );
                                    }
                                  },
                                );
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
