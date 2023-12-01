import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_sesi_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PilihSesiWidget extends StatelessWidget {
  const PilihSesiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PilihSesiViewModel>(
      builder: (context, pilihSesiViewModel, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pilihSesiViewModel.sessions.length,
          itemBuilder: (context, index) {
            var sessionsListData = pilihSesiViewModel.sessions[index];

            return GestureDetector(
              onTap: () {
                pilihSesiViewModel.setSelectedSession(sessionsListData);
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
                          color: pilihSesiViewModel.selectedSession ==
                                  sessionsListData
                              ? primarygreen500
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
                              activeColor: primarygreen500,
                              value: sessionsListData,
                              groupValue: pilihSesiViewModel.selectedSession,
                              onChanged: (value) {
                                pilihSesiViewModel.setSelectedSession(
                                  value.toString(),
                                );
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
