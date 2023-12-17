enum ChatBot { user, bot }

class ChatBotUser {
  final String text;
  final ChatBot chatBot;

  ChatBotUser({
    required this.text,
    required this.chatBot,
  });
}
