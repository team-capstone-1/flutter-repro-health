import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/forum/view_model/chatbot_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/chat_message_profile_widget.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/question_item_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AssistantChatProfileView extends StatelessWidget {
  const AssistantChatProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey10,
      appBar: AppBar(
        title: Text(
          'Repro Assistant',
          style: semiBold16Grey700,
        ),
        backgroundColor: grey10,
        elevation: 1,
        iconTheme: IconThemeData(color: grey700),
      ),
      body: Consumer<ChatbotViewModel>(
        builder: (
          context,
          chatProvider,
          child,
        ) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatProvider.messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index < chatProvider.messages.length) {
                        var message = chatProvider.messages[index];
                        return ChatMessageProfileWidget(
                          text: message.text,
                          chatBot: message.chatBot,
                        );
                      } else {
                        return Visibility(
                          visible: !chatProvider.isLoading,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 12),
                            child: QuestionsList(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: chatProvider.isLoading,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircularProgressIndicator(
                      color: green100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grey200,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            style: semiBold12Grey500,
                            controller: chatProvider.chat,
                            decoration: InputDecoration(
                              fillColor: grey10,
                              filled: true,
                              hintText: 'Kirim pesan disini',
                              labelStyle: regular14Grey200,
                              hintStyle: TextStyle(
                                color: grey200,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send_rounded,
                            color: grey300,
                          ),
                          onPressed: () {
                            if (chatProvider.chat.text.trim().isNotEmpty) {
                              chatProvider.handleSendMessage();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
