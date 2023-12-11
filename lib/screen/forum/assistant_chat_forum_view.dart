import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/forum/view_model/chatbot_view_model.dart';
import 'package:reprohealth_app/screen/forum/widget/chat_message_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AssistantChatForumView extends StatelessWidget {
  const AssistantChatForumView({Key? key}) : super(key: key);

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
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      var message = chatProvider.messages[index];

                      return ChatMessageWidget(
                        text: message.text,
                        chatBot: message.chatBot,
                      );
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
                            chatProvider.handleSendMessage();
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
