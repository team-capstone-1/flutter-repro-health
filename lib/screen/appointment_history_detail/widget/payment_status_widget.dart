import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/constant/appointment_status.dart';
import 'package:reprohealth_app/constant/payment_method.dart';
import 'package:reprohealth_app/constant/payment_status.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

import 'package:reprohealth_app/theme/theme.dart';

class PaymentStatusWidget extends StatelessWidget {
  const PaymentStatusWidget({
    super.key,
    required this.appointmentData,
  });

  final ResponseData? appointmentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: grey10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ Pembayaran berhasil/tertunda/gagal
          buildItemStatus(),
          const SizedBox(height: 16),

          // // ini ditampilkan jika payment == NULL
          // if (appointmentData?.payment?.isEmpty == true)
          //   Padding(
          //     padding: const EdgeInsets.only(
          //       left: 16,
          //       right: 16,
          //       bottom: 16,
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.all(8),
          //       margin: const EdgeInsets.only(bottom: 4),
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: negative,
          //           width: 1.5,
          //         ),
          //         borderRadius: BorderRadius.circular(4),
          //         color: negative25,
          //       ),
          //       child: Text(
          //         "Segera lakukan pembayaran atau membatalkan janji temu",
          //         style: semiBold8Negative,
          //       ),
          //     ),
          //   ),

          //^ Lihat Invoice
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appointmentData?.invoice ?? "-",
                  style: regular14Grey400,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('see invoice');
                    }
                  },
                  child: Text(
                    'Lihat Invoice',
                    style: semiBold12Green500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          //^ Tanggal Transaksi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal Transaksi',
                  style: regular12Grey400,
                ),
                Text(
                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(
                    appointmentData?.consultation?.date ?? DateTime.now(),
                  ),
                  style: semiBold12Grey500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildItemStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 24,
          decoration: BoxDecoration(
            color: () {
              //^ jika janji temu DIPROSES
              if (appointmentData?.status == AppointmentStatus.menunggu ||
                  appointmentData?.status == AppointmentStatus.proses) {
                // jika payment != null
                if (appointmentData?.payment?.isNotEmpty == true) {
                  // jika pembayaran [TRANSFER MANUAL]
                  if (appointmentData?.payment?.first.method ==
                      PaymentMethod.transferManual) {
                    // jika user sudah berhasil bayar
                    if (appointmentData?.paymentStatus == PaymentStatus.done) {
                      return positive;
                      // jika user belum bayar ||
                      // user belum memilih metode pembayaran
                    } else if (appointmentData?.paymentStatus ==
                        PaymentStatus.pending) {
                      return warning;
                      // jika user refund
                    } else {
                      return warning;
                    }

                    // jika pembayaran [DIKLINIK]
                  } else {
                    return positive;
                  }

                  // jika payment == null
                  // berarti menunggu pembayaran
                } else {
                  return warning;
                }

                //^ jika janji temu SELESAI
              } else if (appointmentData?.status == AppointmentStatus.selesai) {
                return positive;

                //^ jika janji temu BATAL
              } else {
                return negative;
              }
            }(),
            borderRadius: const BorderRadius.horizontal(
              right: Radius.circular(24),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          () {
            //^ jika janji temu DIPROSES
            if (appointmentData?.status == AppointmentStatus.menunggu ||
                appointmentData?.status == AppointmentStatus.proses) {
              // payment != null
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika pembayaran [TRANSFER MANUAL]
                if (appointmentData?.payment?.first.method ==
                    PaymentMethod.transferManual) {
                  // jika pembayaran transfer manual pembayaran done
                  if (appointmentData?.paymentStatus == PaymentStatus.done) {
                    return 'Pembayaran Berhasil';
                    // jika pembayaran transfer manual pembayaran pending
                  } else if (appointmentData?.paymentStatus ==
                      PaymentStatus.pending) {
                    return 'Menunggu Pembayaran';
                    // jika pembayaran transfer manual pembayaran refund
                  } else {
                    return 'Memproses Pengembalian Dana';
                  }

                  // jika pembayaran [DIKLINIK]
                } else {
                  return 'Janji Temu Berhasil';
                }

                // jika payment == null
                // berarti menunggu pembayaran
              } else {
                return 'Menunggu Pembayaran';
              }

              //^ jika janji temu SELESAI
            } else if (appointmentData?.status == AppointmentStatus.selesai) {
              return "Janji Temu Berhasil";

              //^ jika janji temu BATAL
            } else {
              return "Janji Temu Dibatalkan";
            }
          }(),
          style: () {
            //^ jika janji temu DIPROSES
            if (appointmentData?.status == AppointmentStatus.menunggu ||
                appointmentData?.status == AppointmentStatus.proses) {
              // jika payment != null
              if (appointmentData?.payment?.isNotEmpty == true) {
                // jika pembayaran [TRANSFER MANUAL]
                if (appointmentData?.payment?.first.method ==
                    PaymentMethod.transferManual) {
                  // jika pembayaran transfer manual done
                  if (appointmentData?.paymentStatus == PaymentStatus.done) {
                    return semiBold14Positive;
                    // jika pembayaran transfer manual pending
                  } else if (appointmentData?.paymentStatus ==
                      PaymentStatus.pending) {
                    return semiBold14Warning;
                    // jika user refund
                  } else {
                    return semiBold14Warning;
                  }

                  // jika pembayaran [DIKLINIK]
                } else {
                  return semiBold14Positive;
                }

                // jika payment == null
                // berarti menunggu pembayaran
              } else {
                return semiBold14Warning;
              }

              //^ jika janji temu SELESAI
            } else if (appointmentData?.status == AppointmentStatus.selesai) {
              return semiBold14Positive;

              //^ jika janji temu BATAL
            } else {
              return semiBold14Negative;
            }
          }(),
        ),
      ],
    );
  }
}
