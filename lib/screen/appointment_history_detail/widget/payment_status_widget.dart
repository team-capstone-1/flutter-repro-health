import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';

import 'package:reprohealth_app/theme/theme.dart';

class PaymentStatusWidget extends StatelessWidget {
  const PaymentStatusWidget({
    super.key,
    required this.appointmentData,
  });

  final Transaction appointmentData;

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

          if (appointmentData.isDoctorAvailable == false)
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: negative,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: negative25,
                ),
                child: Text(
                  "Jadwal dokter tidak tersedia pada pilihan janji temu yang kamu pilih",
                  style: semiBold8Negative,
                ),
              ),
            ),

          //^ Lihat Invoice
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appointmentData.invoice ?? "-",
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
                  appointmentData.transactionDate ?? "-",
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
              if (appointmentData.appointmentStatus == 'Diproses') {
                if (appointmentData.paymentStatus == 'Berhasil') {
                  return positive;
                } else if (appointmentData.paymentStatus == 'Tertunda') {
                  return warning;
                } else if (appointmentData.paymentStatus == 'Refund') {
                  return negative;
                } else {
                  return null;
                }

                //^ jika janji temu SELESAI
              } else if (appointmentData.appointmentStatus == 'Selesai') {
                return positive;

                //^ jika janji temu BATAL
              } else if (appointmentData.appointmentStatus == 'Batal') {
                return negative;
              } else {
                return null;
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
                if (appointmentData.appointmentStatus == 'Diproses') {
                  if (appointmentData.paymentMethod == 'Bayar Diklinik') {
                    return "Janji Temu Tertunda";
                  } else if (appointmentData.paymentMethod ==
                          'Transfer Manual' &&
                      appointmentData.isDoctorAvailable == false) {
                    return "Janji Temu Tertunda";
                  } else if (appointmentData.paymentStatus == 'Tertunda') {
                    return "Menunggu Pembayaran";
                  } else {
                    return "Pembayaran ${appointmentData.paymentStatus}";
                  }

                  //^ jika janji temu SELESAI
                } else if (appointmentData.appointmentStatus == 'Selesai') {
                  return "Pembayaran Berhasil";

                  //^ jika janji temu BATAL
                } else if (appointmentData.appointmentStatus == 'Batal') {
                  if (appointmentData.paymentStatus == 'Transaksi Gagal') {
                    return appointmentData.paymentStatus;
                  } else if (appointmentData.paymentStatus ==
                      'Janji Temu Dibatalkan') {
                    return appointmentData.paymentStatus;
                  } else {
                    return null;
                  }
                } else {
                  return null;
                }
              }() ??
              '-',
          style: () {
            //^ jika janji temu DIPROSES
            if (appointmentData.appointmentStatus == 'Diproses') {
              if (appointmentData.paymentStatus == 'Berhasil') {
                return semiBold14Positive;
              } else if (appointmentData.paymentStatus == 'Tertunda') {
                return semiBold14Warning;
              } else if (appointmentData.paymentStatus == 'Refund') {
                return semiBold14Negative;
              } else {
                return null;
              }

              //^ jika janji temu SELESAI
            } else if (appointmentData.appointmentStatus == 'Selesai') {
              return semiBold14Positive;

              //^ jika janji temu BATAL
            } else if (appointmentData.appointmentStatus == 'Batal') {
              return semiBold14Negative;
            } else {
              return null;
            }
          }(),
        ),
      ],
    );
  }
}
