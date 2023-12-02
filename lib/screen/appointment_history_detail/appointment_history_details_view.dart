import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_expand_widget.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';

import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_detail_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_status_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/refund_detail_widget.dart';

class AppointmentHistoryDetailsView extends StatelessWidget {
  const AppointmentHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as Transaction;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Janji Temu",
          style: semiBold16Grey700,
        ),
        backgroundColor: grey10,
        elevation: 0,
        iconTheme: IconThemeData(
          color: grey700,
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 4),
          //^ paymentStatus PEMBAYARAN
          PaymentStatusWidget(appointmentData: appointmentData),
          const SizedBox(height: 4),

          //^ INFORMASI JANJI TEMU
          // jika janji temu batal & janji temu dibatalkan
          // maka akan menampilkan expansion tile
          if (appointmentData.appointmentStatus == 'Batal') ...[
            if (appointmentData.paymentStatus == 'Janji Temu Dibatalkan') ...[
              AppointmentInfoExpandWidget(appointmentData: appointmentData)
            ] else ...[
              AppointmentInfoWidget(appointmentData: appointmentData),
              const SizedBox(height: 4)
            ]
          ] else ...[
            AppointmentInfoWidget(appointmentData: appointmentData),
            const SizedBox(height: 4),
          ],

          //^ RINCIAN PEMBAYARAN
          PaymentDetailWidget(appointmentData: appointmentData),

          // widget ini ditampilkan ketika:
          // janji temu batal & janji temu dibatalkan
          if (appointmentData.appointmentStatus == 'Batal')
            if (appointmentData.paymentStatus == 'Janji Temu Dibatalkan')
              RefundDetailWidget(appointmentData: appointmentData),

          const SizedBox(height: 200),
        ],
      ),

      backgroundColor: grey50,

      //^ ACTION BUTTON
      bottomSheet: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //^ jika janji temu DIPROSES
              if (appointmentData.appointmentStatus == "Diproses") ...[
                if (appointmentData.paymentMethod == 'Transfer Manual' &&
                    appointmentData.paymentStatus == 'Berhasil') ...[
                  buildTwoActionButton(context, appointmentData),
                ] else if (appointmentData.paymentMethod == 'Transfer Manual' &&
                    appointmentData.paymentStatus == 'Tertunda' &&
                    appointmentData.isDoctorAvailable != false) ...[
                  buildOneActionButton(context, appointmentData)
                ] else if (appointmentData.paymentMethod == 'Transfer Manual' &&
                    appointmentData.paymentStatus == 'Tertunda' &&
                    appointmentData.isDoctorAvailable == false) ...[
                  buildTwoActionButton(context, appointmentData),
                ] else if (appointmentData.paymentMethod ==
                    'Bayar Diklinik') ...[
                  buildTwoActionButton(context, appointmentData)
                ] else ...[
                  const SizedBox(),
                ]

                //^ jika janji temu SELESAI
              ] else if (appointmentData.appointmentStatus == "Selesai") ...[
                buildOneActionButton(context, appointmentData)

                //^ jika janji temu BATAL
              ] else ...[
                buildOneActionButton(context, appointmentData)
              ]
            ],
          ),
        ),
      ),
    );
  }

  //^ ONE ACTION bUTTON
  ButtonComponent buildOneActionButton(
    BuildContext context,
    Transaction appointmentData,
  ) {
    return ButtonComponent(
      backgroundColor: green500,
      labelText: () {
        if (appointmentData.appointmentStatus == 'Batal') {
          if (appointmentData.paymentStatus == 'Transaksi Gagal') {
            return "Janji Temu Lagi";
          } else {
            return "Lihat Bukti Pengembalian";
          }
        } else if (appointmentData.appointmentStatus == 'Selesai') {
          return "Janji Temu Lagi";
        } else {
          return "Bayar";
        }
      }(),
      labelStyle: semiBold12Primary,
      onPressed: () {
        if (appointmentData.appointmentStatus == 'Batal') {
          if (appointmentData.paymentStatus == 'Transaksi Gagal') {
            if (kDebugMode) {
              print("route appointment batal");
            }
          } else {
            if (kDebugMode) {
              print("lihat bukti pembayaran");
            }
          }
        } else if (appointmentData.appointmentStatus == 'Selesai') {
          if (kDebugMode) {
            print("route appointment selesai");
          }
        } else {
          if (kDebugMode) {
            print("route ke halaman payment");
          }
        }
      },
      elevation: 0,
    );
  }

  //^ TWO ACTION BUTTON
  Column buildTwoActionButton(
    BuildContext context,
    Transaction appointmentData,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //^ POSITIVE BUTTON
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonComponent(
            backgroundColor: green500,
            labelText: () {
              if (appointmentData.paymentMethod == 'Transfer Manual' &&
                  appointmentData.paymentStatus == 'Tertunda' &&
                  appointmentData.isDoctorAvailable == false) {
                return "Jadwal Ulang";
              } else if (appointmentData.paymentMethod == 'Bayar Diklinik' &&
                  appointmentData.paymentStatus == 'Tertunda' &&
                  appointmentData.isDoctorAvailable == false) {
                return "Bayar";
              } else {
                return "Ganti Jadwal";
              }
            }(),
            labelStyle: semiBold12Primary,
            onPressed: () {
              if (appointmentData.paymentMethod == 'Bayar Diklinik' &&
                  appointmentData.paymentStatus == 'Tertunda' &&
                  appointmentData.isDoctorAvailable == false) {
                // routes ke halaman payment
                if (kDebugMode) {
                  print("Routes Kehalaman Payment");
                }
              } else {
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.rescedhuleView,
                  arguments: appointmentData,
                );
              }
            },
            elevation: 0,
          ),
        ),
        const SizedBox(height: 8),

        //^ NEGATIVE BUTTON
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonComponent(
            backgroundColor: negative,
            labelText: appointmentData.paymentMethod == 'Transfer Manual'
                ? "Batal"
                : "Batalkan Jadwal",
            labelStyle: semiBold12Primary,
            onPressed: () {
              if (appointmentData.paymentMethod == 'Bayar Diklinik') {
                //pindah halaman refund bayar di klinik
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.canceAppointmentPaymentAtClinic,
                  arguments: appointmentData,
                );
              } else {
                //pindah halaman refund transfer manual
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.refundView,
                  arguments: appointmentData,
                );
              }
            },
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
