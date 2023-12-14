import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/chat_bot_models.dart';
import 'package:reprohealth_app/services/chatbot_services/chatbot_services.dart';

class ChatbotViewModel extends ChangeNotifier {
  final ChatbotServices chatBotServices = ChatbotServices();
  final TextEditingController _chat = TextEditingController();

  final List<ChatBotUser> _messages = [];
  List<ChatBotUser> get messages => _messages;

  bool isLoading = false;

  TextEditingController get chat => _chat;

  Future<void> handleSendMessage() async {
    _messages.add(
      ChatBotUser(
        text: _chat.text,
        chatBot: ChatBot.user,
      ),
    );
    isLoading = true;

    notifyListeners();

    var input = _chat.text;
    _chat.clear();

    try {
      var response = await chatBotServices.postChatbotServices(messages: input);

      isLoading = false;
      _messages.add(
        ChatBotUser(
          text: response,
          chatBot: ChatBot.bot,
        ),
      );

      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print("Error in generateResponse: $error");
      }
    }
  }
}
