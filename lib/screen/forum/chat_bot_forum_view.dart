import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forum/widget/container_chat_bot_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChatBotForumView extends StatelessWidget {
  const ChatBotForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Kembali Ke Forum',
            style: semiBold16Primary4,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              children: [
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 150,
                  width: 328,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black,
                  ),
                  child: Image.asset(
                    'assets/chatbot_logo.png',
                    height: 105,
                    width: 264,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Text(
                //   'Riwayat Chat',
                //   style: semiBold16Grey900,
                // ),
                const SizedBox(
                  height: 24,
                ),
                const ContainerChatBotWidget(
                  text:
                      'Apakah penyakit dari seseorang yang memiliki gejala seperti bercak putih di mulut, ruam, dan flu ringan?',
                ),
                const ContainerChatBotWidget(
                  text:
                      'Apakah penyakit dari seseorang yang memiliki gejala seperti bercak putih di mulut, ruam, dan flu ringan?',
                ),
                const ContainerChatBotWidget(
                  text:
                      'Apakah penyakit dari seseorang yang memiliki gejala seperti bercak putih di mulut, ruam, dan flu ringan?',
                ),
                const ContainerChatBotWidget(
                  text:
                      'Apakah penyakit dari seseorang yang memiliki gejala seperti bercak putih di mulut, ruam, dan flu ringan?',
                ),
                const ContainerChatBotWidget(
                  text:
                      'Apakah penyakit dari seseorang yang memiliki gejala seperti bercak putih di mulut, ruam, dan flu ringan?',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ButtonComponent(
              labelText: 'Buat Pesan Baru',
              labelStyle: semiBold12Green500,
              border: BorderSide(color: green500, width: 2),
              backgroundColor: grey10,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.assistantChatForumView,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
