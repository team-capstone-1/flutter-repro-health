import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PilihSesiWidget extends StatelessWidget {
  const PilihSesiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JanjiTemuViewModel>(
      builder: (context, janjiTemuViewModel, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: janjiTemuViewModel.sessions.length,
          itemBuilder: (context, index) {
            var sessionsListData = janjiTemuViewModel.sessions[index];
            return GestureDetector(
              onTap: () {
                janjiTemuViewModel.setSelectedSession = sessionsListData;
              },
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: janjiTemuViewModel.selectedSession ==
                                  sessionsListData
                              ? green500
                              : const Color.fromARGB(255, 82, 82, 82),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              sessionsListData,
                              style: medium12Grey500,
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Radio(
                              activeColor: green500,
                              value: sessionsListData,
                              groupValue: janjiTemuViewModel.selectedSession,
                              onChanged: (value) {
                                janjiTemuViewModel.setSelectedSession = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
