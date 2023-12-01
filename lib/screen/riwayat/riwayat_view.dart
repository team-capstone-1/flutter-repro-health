import 'package:flutter/material.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/riwayat/widget/appointment_list_item_widget.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/widget/chip_appointment_length_widget.dart';

class RiwayatView extends StatelessWidget {
  const RiwayatView({super.key});

  @override
  Widget build(BuildContext context) {
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
          bottom: TabBar(
            labelColor: green800,
            labelStyle: medium14Green800,
            unselectedLabelColor: grey200,
            indicatorWeight: 3,
            indicatorColor: green800,
            tabs: [
              //^ TITLE DIPROSES
              Tab(
                child: appointmentOnProcess.isNotEmpty
                    ? ChipAppointmentLengthWidget(
                        text: "Diproses",
                        length: appointmentOnProcess.length,
                      )
                    : const Text("Diproses"),
              ),

              //^ TITLE SELESAI
              Tab(
                child: appointmentSucces.isNotEmpty
                    ? ChipAppointmentLengthWidget(
                        text: "Selesai",
                        length: appointmentSucces.length,
                      )
                    : const Text("Selesai"),
              ),

              //^ TITLE BATAL
              Tab(
                child: appointmentCancel.isNotEmpty
                    ? ChipAppointmentLengthWidget(
                        text: "Batal",
                        length: appointmentCancel.length,
                      )
                    : const Text("Batal"),
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
                    child: appointmentOnProcess.isNotEmpty
                        ? buildAppointmentOnProcess()
                        : buildEmptyAppointmentData(),
                  ),
                ),
              ],
            ),

            //^ SELESAI
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: appointmentSucces.isNotEmpty
                        ? buildAppointmentSucces()
                        : buildEmptyAppointmentData(),
                  ),
                ),
              ],
            ),

            //^ BATAL
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: appointmentCancel.isNotEmpty
                        ? buildAppointmentCancel()
                        : buildEmptyAppointmentData(),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: grey50,
      ),
    );
  }

  //^ TABBAR DIPROSES
  ListView buildAppointmentOnProcess() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentOnProcess.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentOnProcess[index];

        return AppointmentListItemWidget(
          appointmentData: appointmentData,
          visibleStatusContainer: true,
          onPressed: () {
            if (appointmentData.paymentStatus == 'Refund') {
              Navigator.pushNamed(
                context,
                RoutesNavigation.refundDetailsView,
                arguments: appointmentData,
              );
            } else {
              Navigator.pushNamed(
                context,
                RoutesNavigation.appointmentHistoryDetailView,
                arguments: appointmentData,
              );
            }
          },
        );
      },
    );
  }

  //^ TABBAR SELESAI
  ListView buildAppointmentSucces() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentSucces.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentSucces[index];

        return AppointmentListItemWidget(
          appointmentData: appointmentData,
          visibleStatusContainer: false,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutesNavigation.appointmentHistoryDetailView,
              arguments: appointmentData,
            );
          },
        );
      },
    );
  }

  //^ TABBAR SELESAI
  ListView buildAppointmentCancel() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: appointmentCancel.length,
      itemBuilder: (context, index) {
        var appointmentData = appointmentCancel[index];

        return AppointmentListItemWidget(
          appointmentData: appointmentData,
          visibleStatusContainer: false,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutesNavigation.appointmentHistoryDetailView,
              arguments: appointmentData,
            );
          },
        );
      },
    );
  }

  //^ LIST DATA KOSONG
  Container buildEmptyAppointmentData() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: grey10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            color: grey100,
          ),
          const SizedBox(height: 16),
          Text(
            "Belum Ada Transaksi",
            style: semiBold14Grey400,
          ),
        ],
      ),
    );
  }
}
