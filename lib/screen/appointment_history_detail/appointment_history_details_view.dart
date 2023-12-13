import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:reprohealth_app/constant/payment_method.dart';
import 'package:reprohealth_app/constant/payment_status.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/constant/appointment_status.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';

import 'package:reprohealth_app/screen/appointment_history_detail/widget/refund_detail_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_detail_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/payment_status_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_widget.dart';
import 'package:reprohealth_app/screen/appointment_history_detail/widget/appointment_info_expand_widget.dart';

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
          // widget expansion tile ditampilkan KETIKA ->
          // janji temu BATAL && metode pembayaran TRANSFER MANUAL &&
          // payment status == REFUND
          if (appointmentData.status == AppointmentStatus.batal) ...[
            if (appointmentData.consultation?.paymentMethod ==
                    PaymentMethod.transferManual &&
                appointmentData.paymentStatus == PaymentStatus.refund) ...[
              AppointmentInfoExpandWidget(appointmentData: appointmentData)
            ] else ...[
              AppointmentInfoWidget(appointmentData: appointmentData),
              const SizedBox(height: 4),
            ]
          ] else ...[
            AppointmentInfoWidget(appointmentData: appointmentData),
            const SizedBox(height: 4),
          ],

          //^ RINCIAN PEMBAYARAN
          PaymentDetailWidget(appointmentData: appointmentData),

          // widget ini ditampilkan KETIKA ->
          // janji temu BATAL && metode pembayaran TRANSFER MANUAL &&
          // payment status == REFUND
          if (appointmentData.status == AppointmentStatus.batal)
            if (appointmentData.consultation?.paymentMethod ==
                    PaymentMethod.transferManual &&
                appointmentData.paymentStatus == PaymentStatus.refund)
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
                //jika pembayaran [TRANSFER MANUAL]
                if (appointmentData.consultation?.paymentMethod ==
                    PaymentMethod.transferManual) ...[
                  //jika sudah berhasil bayar
                  if (appointmentData.paymentStatus == PaymentStatus.done) ...[
                    buildTwoActionButton(context, appointmentData)

                    // jika user belum bayar
                  ] else if (appointmentData.paymentStatus ==
                      PaymentStatus.pending) ...[
                    buildOneActionButton(context, appointmentData)

                    //jika user refund
                  ] else ...[
                    buildOneActionButton(context, appointmentData)
                  ]

                  // jika pembayaran [DIKLINIK]
                ] else ...[
                  buildTwoActionButton(context, appointmentData)
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
      elevation: 0,
      backgroundColor: green500,
      labelText: Text(
        () {
              //^ jika janji temu DIPROSES
              if (appointmentData?.status == AppointmentStatus.menunggu ||
                  appointmentData?.status == AppointmentStatus.proses) {
                // jika user belum bayar
                // dengan tipe pembayaran [TRANSFER MANUAL]
                if (appointmentData?.paymentStatus == PaymentStatus.pending) {
                  return "Bayar";

                  // jika user refund
                } else if (appointmentData?.paymentStatus ==
                    PaymentStatus.refund) {
                  return "Lihat Proses";
                }

                //^ jika janji temu SELESAI
              } else if (appointmentData?.status == AppointmentStatus.selesai) {
                return "Janji Temu Lagi";

                //^ jika janji temu BATAL
              } else {
                //* TRANSAKSI GAGAL
                // terjadi ketika status appointmentnya == cancelled
                // TAPI paymentStatusnya == pending
                if (appointmentData?.paymentStatus == PaymentStatus.pending) {
                  return "Janji Temu Lagi";

                  //* JANJI TEMU DIBATALKAN
                  // terjadi ketika status appointmentnya == cancelled
                  // DAN paymentStatusnya == done/refund
                  // --------------------
                  // terbagi menjadi 2 kondisi: transfer manual & bayar diklinik
                } else {
                  if (appointmentData?.consultation?.paymentMethod ==
                      PaymentMethod.transferManual) {
                    return "Lihat Bukti Pengembalian";
                  } else {
                    return "Janji Temu Lagi";
                  }
                }
              }
            }() ??
            "-",
        style: semiBold12Primary,
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        //^ jika janji temu DIPROSES
        if (appointmentData?.status == AppointmentStatus.menunggu ||
            appointmentData?.status == AppointmentStatus.proses) {
          // jika user belum bayar
          // dengan tipe pembayaran [TRANSFER MANUAL]
          if (appointmentData?.paymentStatus == PaymentStatus.pending) {
            Navigator.pushNamed(
              context,
              RoutesNavigation.paymentMethodView,
              arguments: IdArgument(
                idTransaction: appointmentData?.id,
                idProfile: appointmentData?.consultation?.patientId,
              ),
            );
            print(appointmentData?.id);
            // if (kDebugMode) {
            //   // print('Anda belum membayar tagihan');
            //   // print('BAYAR');
            //   // print('Pembayaran transfer manual');
            //   // print('route kehalaman -> pembayaran');
            // }

            // jika user refund
          } else if (appointmentData?.paymentStatus == PaymentStatus.refund) {
            Navigator.pushNamed(
              context,
              RoutesNavigation.refundDetailsView,
              arguments: appointmentData,
            );
          }

          //^ jika janji temu SELESAI
        } else if (appointmentData?.status == AppointmentStatus.selesai) {
          if (kDebugMode) {
            print('Janji Temu Selesai');
            print('JANJI TEMU LAGI');
            print('route kehalaman -> appointment');
          }

          //^ jika janji temu BATAL
        } else {
          //* TRANSAKSI GAGAL
          // terjadi ketika status appointmentnya == cancelled
          // TAPI paymentStatusnya == pending
          if (appointmentData?.paymentStatus == PaymentStatus.pending) {
            if (kDebugMode) {
              print('Transaksi gagal - anda belum membayar tagihan');
              print('JANJI TEMU LAGI');
              print('Pembayaran Diklinik');
              print('route kehalaman -> appointment');
            }

            //* JANJI TEMU DIBATALKAN
            // terjadi ketika status appointmentnya == cancelled
            // DAN paymentStatusnya == done/refund
            // --------------------
            // terbagi menjadi 2 kondisi: transfer manual & bayar diklinik
          } else {
            // transfer manual
            if (appointmentData?.consultation?.paymentMethod ==
                PaymentMethod.transferManual) {
              // route kehalaman -> detail refund
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesNavigation.refundDetailsView,
                (route) => route.isFirst,
                arguments: appointmentData,
              );

              // bayar diklinik
            } else {
              if (kDebugMode) {
                print('Janji temu dibatalkan - anda membatalkan janji temu');
                print('JANJI TEMU LAGI');
                print('Pembayaran diklinik');
                print('route kehalaman -> appointment');
              }
            }
          }
        }
      },
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
        // user hanya dikasih kesempatan 1 kali untuk melakukan reschedule
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonComponent(
            elevation: 0,
            backgroundColor: green500,
            labelText: Text(
              "Ganti Jadwal",
              style: semiBold12Primary,
              textAlign: TextAlign.center,
            ),
            onPressed: appointmentData?.consultation?.rescheduled == false
                ? () {
                    Navigator.pushNamed(
                      context,
                      RoutesNavigation.rescedhuleView,
                      arguments: appointmentData ?? ResponseData(),
                    );
                  }
                : null,
          ),
        ),
        const SizedBox(height: 8),

        //^ NEGATIVE BUTTON
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonComponent(
            elevation: 0,
            backgroundColor: negative,
            labelText: Text(
              "Batalkan Jadwal",
              style: semiBold12Primary,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              // jika user pembayaran [TRANSFER MANUAL]
              if (appointmentData?.consultation?.paymentMethod ==
                  PaymentMethod.transferManual) {
                //route ke-> halaman refund
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.refundView,
                  arguments: appointmentData,
                );

                // jika user pembayaran [DIKLINIK]
              } else {
                //route ke-> halaman batal di klinik
                Navigator.pushNamed(
                  context,
                  RoutesNavigation.canceAppointmentPaymentAtClinic,
                  arguments: appointmentData,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
