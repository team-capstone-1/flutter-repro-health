import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/forum/view_model/chatbot_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class QuestionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              child: Image.asset(
                Assets.assetsAIProfile,
              ),
            ),
          ),
          Container(
            height: 300,
            width: 213,
            decoration: BoxDecoration(
                border: Border.all(width: 3, color: green500),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                )),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: green500,
                      border: Border.all(
                        color: green500,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Halo! Pilih kategori yang ingin kamu tanyakan atau ketik pertanyaanmu di chatbox.",
                      style: semiBold12Grey5,
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer<ChatbotViewModel>(
                    
                    builder: (context, categoryProvider, child) {
                      return ListView.separated(
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          final category = categoryProvider.categories[index];
                          return GestureDetector(
                            onTap: () {
                              categoryProvider.addCategoryToChat(category);
                              print(category);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child:
                                      Text(category, style: semiBold12Green500),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 1,
                            color: green500,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }
}
