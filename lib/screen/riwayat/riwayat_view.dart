import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';

import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/screen/riwayat/widget/appointment_list_item_widget.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/riwayat/widget/chip_appointment_length_widget.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({super.key});

  @override
  State<RiwayatView> createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  final String patientId = "91006a69-9237-42be-80b7-4aabfe88e59e";

  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatViewModel>(
      context,
      listen: false,
    ).getTransaction(
      patientId: patientId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RiwayatViewModel>(
      builder: (context, transaction, child) {
        var transactionProcessed = transaction.getProcessedTransactions();
        var transactionSuccesed = transaction.getSuceesedTransactions();
        var transactionCancelled = transaction.getCancelledTransactions();

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Riwayat Transaksi",
                style: semiBold16Grey700,
              ),
              backgroundColor: grey10,
              elevation: 0,
              iconTheme: IconThemeData(color: grey700),
              bottom: TabBar(
                labelColor: green800,
                labelStyle: medium14Green800,
                unselectedLabelColor: grey200,
                indicatorWeight: 3,
                indicatorColor: green800,
                tabs: [
                  //^ TITLE DIPROSES
                  Tab(
                    child: ChipAppointmentLengthWidget(
                      text: "Diproses",
                      length: transactionProcessed.length,
                    ),
                  ),

                  //^ TITLE SELESAI
                  Tab(
                    child: ChipAppointmentLengthWidget(
                      text: "Selesai",
                      length: transactionSuccesed.length,
                    ),
                  ),

                  //^ TITLE BATAL
                  Tab(
                    child: ChipAppointmentLengthWidget(
                      text: "Batal",
                      length: transactionCancelled.length,
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                //^ DI PROSES
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: transactionProcessed.isNotEmpty == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: transactionProcessed.length,
                                itemBuilder: (context, index) {
                                  var appointmentData =
                                      transactionProcessed[index];

                                  return AppointmentListItemWidget(
                                    appointmentData: appointmentData,
                                    visibleStatusContainer: true,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesNavigation
                                            .appointmentHistoryDetailView,
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
                ),

                //^ SELESAI
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: transactionSuccesed.isNotEmpty == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: transactionSuccesed.length,
                                itemBuilder: (context, index) {
                                  var appointmentData =
                                      transactionSuccesed[index];
                                  return AppointmentListItemWidget(
                                    appointmentData: appointmentData,
                                    visibleStatusContainer: false,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesNavigation
                                            .appointmentHistoryDetailView,
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
                ),

                //^ BATAL
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: transactionCancelled.isNotEmpty == true
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: transactionCancelled.length,
                                itemBuilder: (context, index) {
                                  var appointmentData =
                                      transactionCancelled[index];
                                  return AppointmentListItemWidget(
                                    appointmentData: appointmentData,
                                    visibleStatusContainer: false,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesNavigation
                                            .appointmentHistoryDetailView,
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
                ),
              ],
            ),
            backgroundColor: grey50,
          ),
        );
      },
    );
  }
}
