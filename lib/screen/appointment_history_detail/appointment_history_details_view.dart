import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:reprohealth_app/constant/appointment_status.dart';
import 'package:reprohealth_app/constant/payment_method.dart';
import 'package:reprohealth_app/constant/payment_status.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
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
          // widget expansion tile ditampilkan KETIKA ->
          // janji temu BATAL && metode pembayaran TRANSFER MANUAL &&
          // payment status == REFUND
          if (appointmentData.status == AppointmentStatus.batal) ...[
            if (appointmentData.payment?.first.method ==
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
            if (appointmentData.payment?.first.method ==
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
                // jika payment != null
                if (appointmentData.payment?.isNotEmpty == true) ...[
                  //jika pembayaran [TRANSFER MANUAL]
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

                    // jika pembayaran [DIKLINIK]
                  ] else ...[
                    buildTwoActionButton(context, appointmentData)
                  ]

                  // jika payment == null
                  // berarti menunggu pembayaran
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
              // jika payment != null
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika status pembayaran refund
                if (appointmentData?.paymentStatus == PaymentStatus.refund) {
                  return "Lihat Proses";
                }

                // user belum bayar
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
      onPressed: () {
        //^ jika janji temu DIPROSES
        if (appointmentData?.status == AppointmentStatus.menunggu ||
            appointmentData?.status == AppointmentStatus.proses) {
          // jika user belum melakukan pembayaran
          if (appointmentData?.payment?.isEmpty == true) {
            if (kDebugMode) {
              print('bayar');
            }

            // jika user melakukan refund
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
            print('janji temu lagi');
          }

          //^ jika janji temu BATAL
        } else {
          if (kDebugMode) {
            print('janji temu lagi');
          }
        }
      },
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
              // jika payment empty
              if (appointmentData?.payment?.isEmpty == true) {
                return "Bayar";
              } else {
                return "Ganti Jadwal";
              }
            }(),
            labelStyle: semiBold12Primary,
            onPressed: () {
              if (appointmentData?.status == AppointmentStatus.menunggu ||
                  appointmentData?.status == AppointmentStatus.proses) {
                if (appointmentData?.payment?.isNotEmpty == true) {
                  //
                  //^ route ke halaman rescedhule
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.rescedhuleView,
                    arguments: appointmentData,
                  );
                } else {
                  if (kDebugMode) {
                    print('bayar');
                  }
                }

                // belum ada event yang memenuhi kondisi ini
              } else {
                if (kDebugMode) {
                  print('-');
                }
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
            labelText: () {
              // cek null safety untuk paymnet
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika user melakukan pembayaran transfer manual
                if (appointmentData?.payment?.first.method ==
                    PaymentMethod.transferManual) {
                  return "Batal";

                  // jika user melakukan pembayaran diklinik
                } else {
                  return "Batalkan Jadwal";
                }

                // jika user belum melakukan create payment
              } else {
                return "Batalkan Janji Temu";
              }
            }(),
            labelStyle: semiBold12Primary,
            onPressed: () {
              // cek null safety untuk paymnet
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika user melakukan pembayaran transfer manual
                if (appointmentData?.payment?.first.method ==
                    PaymentMethod.transferManual) {
                  //route ke-> halaman refund
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.refundView,
                    arguments: appointmentData,
                  );

                  // jika user melakukan pembayaran diklinik
                } else {
                  //route ke-> halaman batal di klinik
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.canceAppointmentPaymentAtClinic,
                    arguments: appointmentData,
                  );
                }
              }
            },
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
