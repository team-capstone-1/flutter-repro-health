import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/payment_status.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class AppointmentListItemWidget extends StatelessWidget {
  const AppointmentListItemWidget({
    super.key,
    required this.appointmentData,
    required this.visibleStatusContainer,
    required this.onPressed,
  });

  final ResponseData? appointmentData;
  final bool visibleStatusContainer;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var concultation = appointmentData?.consultation;
    var controller = Provider.of<RiwayatViewModel>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(12),
      color: grey10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //^ Foto Dokter
              ClipOval(
                child: Image.network(
                  concultation?.doctor?.profileImage?.isNotEmpty == true
                      ? concultation?.doctor?.profileImage ??
                          controller.nullImage
                      : controller.nullImage,
                  fit: BoxFit.cover,
                  height: 45,
                  width: 45,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //^ Nama Dokter
                  Text(
                    concultation?.doctor?.name ?? "-",
                    style: semiBold14Grey500,
                  ),

                  //^ Spesialis
                  Text(
                    concultation?.doctor?.specialist ?? '-',
                    style: regular12Grey200,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //^ Nomer Urut
                  Text(
                    appointmentData?.consultation?.queueNumber?.toString() ??
                        '-',
                    style: semiBold12Green500,
                  ),

                  //^ Container paymentStatus Pembayaran
                  Visibility(
                    visible: visibleStatusContainer,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: () {
                          if (appointmentData?.payment?.isNotEmpty == true) {
                            // jika user sudah berhasil bayar
                            if (appointmentData?.paymentStatus ==
                                PaymentStatus.done) {
                              return positive25;
                              // jika user belum bayar ||
                              // user belum memilih metode pembayaran
                            } else if (appointmentData?.paymentStatus ==
                                PaymentStatus.pending) {
                              return warning25;
                              // jika user refund
                            } else {
                              return negative25;
                            }

                            // jika payment == nulll
                            // berarti menunggu pembayaran
                          } else {
                            return warning25;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        () {
                          if (appointmentData?.payment?.isNotEmpty == true) {
                            // jika user sudah berhasil bayar
                            if (appointmentData?.paymentStatus ==
                                PaymentStatus.done) {
                              return 'Selesai';
                              // jika user belum bayar ||
                              // user belum memilih metode pembayaran
                            } else if (appointmentData?.paymentStatus ==
                                PaymentStatus.pending) {
                              return 'Tertunda';
                              // jika user refund
                            } else {
                              return 'Refund';
                            }

                            // jika payment == nulll
                            // berarti menunggu pembayaran
                          } else {
                            return 'Tertunda';
                          }
                        }(),
                        style: () {
                          if (appointmentData?.payment?.isNotEmpty == true) {
                            // jika user sudah berhasil bayar
                            if (appointmentData?.paymentStatus ==
                                PaymentStatus.done) {
                              return semiBold10Positive;
                              // jika user belum bayar ||
                              // user belum memilih metode pembayaran
                            } else if (appointmentData?.paymentStatus ==
                                PaymentStatus.pending) {
                              return semiBold10Warning;
                              // jika user refund
                            } else {
                              return semiBold10Negative;
                            }

                            // jika payment == nulll
                            // berarti menunggu pembayaran
                          } else {
                            return semiBold10Warning;
                          }
                        }(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              //^ Klinik
              Text(
                concultation?.clinic?.name ?? "-",
                style: medium14Grey500,
              ),
              const SizedBox(height: 12),

              //^ Lokasi
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Text(
                  appointmentData?.consultation?.clinic?.location ?? '-',
                  style: medium14Grey300,
                ),
              ),
              const SizedBox(height: 12),

              //^ Jadwal & Sesi
              RichText(
                text: TextSpan(
                  // text == Selasa, 5 Desember 2023
                  text: DateFormat('EEEE, d MMMM y', 'id_ID').format(
                    concultation?.date ?? DateTime.now(),
                  ),
                  style: medium14Grey300,
                  children: [
                    // text == -
                    TextSpan(text: ' - ', style: medium14Grey300),
                    // text == Pagi/Siang?Sore
                    TextSpan(
                      text: appointmentData?.consultation?.session?.replaceAll(
                        appointmentData!.consultation!.session![0],
                        appointmentData!.consultation!.session![0]
                            .toUpperCase(),
                      ),
                      style: medium14Grey300,
                    ),
                    // text == (
                    TextSpan(text: ' (', style: medium14Grey300),
                    // text == 08.00-11.00
                    TextSpan(
                      text: () {
                        if (appointmentData?.consultation?.session == 'pagi') {
                          return "08.00-11.00";
                        } else if (appointmentData?.consultation?.session ==
                            'siang') {
                          return "13.00-15.30";
                        } else {
                          return "18.30-20.30";
                        }
                      }(),
                      style: medium14Green500,
                    ),
                    // text == )
                    TextSpan(text: ')', style: medium14Grey300),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ BUTTON LIHAT RINCIAN
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  width: 1.5,
                  color: positive,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Lihat Rincian",
                  style: semiBold12Green500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
