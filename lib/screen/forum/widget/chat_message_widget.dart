import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/chatbot_models/chat_bot_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatBot chatBot;
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatBot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: chatBot == ChatBot.bot ? green500 : green200,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chatBot == ChatBot.bot
                ? Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundColor: green600,
                      child: Image.asset(
                        'assets/foto_spesialis4.png',
                        scale: 1.5,
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundColor: green500,
                      child: const Icon(Icons.person_add_alt),
                    ),
                  ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      text,
                      style: semiBold12Primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
