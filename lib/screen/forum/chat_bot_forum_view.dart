import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/forum/view_model/chatbot_history_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChatBotForumView extends StatelessWidget {
  const ChatBotForumView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ChatbotHistoryViewModel>(context, listen: false)
        .getHistoryChatbot();
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
          Consumer<ChatbotHistoryViewModel>(builder: (context, history, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: history.chatbotHistoryViewModel?.response?.length,
                itemBuilder: (context, index) {
                  var historyData =
                      history.chatbotHistoryViewModel?.response?[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grey400,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      historyData?.data?.pesan?.first.pesan ?? '',
                      style: regular14Grey400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ButtonComponent(
              labelText: Text(
                "Buat Pesan Baru",
                style: semiBold12Green500,
                textAlign: TextAlign.center,
              ),
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
