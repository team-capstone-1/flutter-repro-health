import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/chatbot_models/chatbot_history_models.dart';
import 'package:reprohealth_app/services/chatbot_services/chatbot_services.dart';

class ChatbotHistoryViewModel extends ChangeNotifier {
  final chatbotHistoryServices = ChatbotServices();
  ChatbotHistoryModels? chatbotHistoryViewModel;

  Future<void> getHistoryChatbot() async {
    try {
      chatbotHistoryViewModel =
          await chatbotHistoryServices.getChatbotHistory();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
