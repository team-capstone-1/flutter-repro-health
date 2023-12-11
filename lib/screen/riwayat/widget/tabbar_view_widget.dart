import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';

import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/screen/riwayat/widget/appointment_list_item_widget.dart';

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({
    super.key,
    required this.transactionData,
    required this.visibleStatusContainer,
  });

  final List<ResponseData> transactionData;
  final bool visibleStatusContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: transactionData.isNotEmpty == true
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: transactionData.length,
                    itemBuilder: (context, index) {
                      var appointmentData = transactionData[index];

                      return AppointmentListItemWidget(
                        appointmentData: appointmentData,
                        visibleStatusContainer: visibleStatusContainer,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesNavigation.appointmentHistoryDetailView,
                            arguments: appointmentData,
                          );
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text('kosong'),
                  ),
          ),
        ),
      ],
    );
  }
}
