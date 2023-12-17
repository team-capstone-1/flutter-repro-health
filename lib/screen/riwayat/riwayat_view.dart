import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/riwayat/widget/shimmer_loading_widget.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/riwayat/widget/tabbar_view_widget.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/screen/riwayat/widget/chip_appointment_length_widget.dart';

class RiwayatView extends StatefulWidget {
  const RiwayatView({super.key});

  @override
  State<RiwayatView> createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatViewModel>(
      context,
      listen: false,
    ).getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RiwayatViewModel>(context);

    //^ Transaction [LIST] By Statuses
    var transactionProcessed = controller.getProcessedTransactions();
    var transactionSuccesed = controller.getSuceesedTransactions();
    var transactionCancelled = controller.getCancelledTransactions();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Riwayat Transaksi",
            style: semiBold16Grey700,
          ),
          elevation: 0,
          backgroundColor: grey10,
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
        backgroundColor: grey50,
        body: Consumer<RiwayatViewModel>(
          builder: (context, controller, child) {
            return TabBarView(
              children: [
                //^ DI PROSES
                if (controller.isLoading == false)
                  TabBarViewWidget(
                    transactionData: transactionProcessed,
                  )
                else
                  const ShimmerLoadingWidget(),
      
                //^ SELESAI
                if (controller.isLoading == false)
                  TabBarViewWidget(
                    transactionData: transactionSuccesed,
                  )
                else
                  const ShimmerLoadingWidget(),
      
                //^ BATAL
                if (controller.isLoading == false)
                  TabBarViewWidget(
                    transactionData: transactionCancelled,
                  )
                else
                  const ShimmerLoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
