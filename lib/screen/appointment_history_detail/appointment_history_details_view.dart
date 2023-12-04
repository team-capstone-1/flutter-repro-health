import 'package:flutter/material.dart';

import 'package:reprohealth_app/constant/appointment_status.dart';
import 'package:reprohealth_app/constant/payment_method.dart';
import 'package:reprohealth_app/constant/payment_status.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_expand_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/refund_detail_widget.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';

import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_detail_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_status_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_widget.dart';

class AppointmentHistoryDetailsView extends StatelessWidget {
  const AppointmentHistoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as ResponseData;

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
          if (appointmentData.status == AppointmentStatus.batal) ...[
            AppointmentInfoExpandWidget(appointmentData: appointmentData)
          ] else ...[
            AppointmentInfoWidget(appointmentData: appointmentData),
            const SizedBox(height: 4),
          ],

          //^ RINCIAN PEMBAYARAN
          PaymentDetailWidget(appointmentData: appointmentData),

          // widget ini ditampilkan ketika:
          // janji temu dibatalkan dengan pembayaran transfer manual
          if (appointmentData.status == AppointmentStatus.batal)
            if (appointmentData.payment?.first.method ==
                PaymentMethod.transferManual)
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
              if (appointmentData.status == AppointmentStatus.menunggu ||
                  appointmentData.status == AppointmentStatus.proses) ...[
                // cek null savety payment
                if (appointmentData.payment?.isNotEmpty == true) ...[
                  //jika pembayaran transfer manual
                  if (appointmentData.payment?.first.method ==
                      PaymentMethod.transferManual) ...[
                    //jika status pembayaran berhasil
                    if (appointmentData.paymentStatus ==
                        PaymentStatus.done) ...[
                      buildTwoActionButton(context, appointmentData)
                      //jika status pembayaran refund
                    ] else ...[
                      buildOneActionButton(context, appointmentData)
                    ]

                    // jika pembayaran bayar diklinik
                  ] else ...[
                    buildTwoActionButton(context, appointmentData)
                  ]
                ] else ...[
                  buildOneActionButton(context, appointmentData)
                ],

                //^ jika janji temu SELESAI
              ] else if (appointmentData.status ==
                  AppointmentStatus.selesai) ...[
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
    ResponseData? appointmentData,
  ) {
    return ButtonComponent(
      backgroundColor: green500,
      labelText: () {
            //^ jika janji temu DIPROSES
            if (appointmentData?.status == AppointmentStatus.menunggu ||
                appointmentData?.status == AppointmentStatus.proses) {
              // cek null safety payment
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika status pembayaran refund
                if (appointmentData?.paymentStatus == PaymentStatus.refund) {
                  return "Lihat Proses";
                }

                // jika user belum melakukan create payment
                // -> route ke halaman payment
              } else {
                return "Bayar";
              }

              //^ jika janji temu SELESAI
            } else if (appointmentData?.status == AppointmentStatus.selesai) {
              return "Janji Temu Lagi";

              //^ jika janji temu BATAL
            } else {
              // jika user pembayaran transfer manual
              if (appointmentData?.paymentStatus == PaymentStatus.refund) {
                return "Lihat Bukti Pengembalian";
                // jika user pembayaran transfer manual
              } else {
                return "Janji Temu Lagi";
              }
            }
          }() ??
          '-',
      labelStyle: semiBold12Primary,
      onPressed: () {},
      elevation: 0,
    );
  }

  //^ TWO ACTION BUTTON
  Column buildTwoActionButton(
    BuildContext context,
    ResponseData? appointmentData,
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
              // cek null safety payment
              // kondisi untuk semua metode pembayaran
              if (appointmentData?.payment?.isNotEmpty == true) {
                return "Ganti Jadwal";
              } else {
                return "";
              }
            }(),
            labelStyle: semiBold12Primary,
            onPressed: () {},
            elevation: 0,
          ),
        ),
        const SizedBox(height: 8),

        //^ NEGATIVE BUTTON
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonComponent(
            backgroundColor: negative,
            labelText: () {
              if (appointmentData?.payment?.isNotEmpty == true) {
                if (appointmentData?.payment?.first.method ==
                    PaymentMethod.transferManual) {
                  return "Batal";
                } else {
                  return "Batalkan Jadwal";
                }
              } else {
                return "";
              }
            }(),
            labelStyle: semiBold12Primary,
            onPressed: () {},
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
