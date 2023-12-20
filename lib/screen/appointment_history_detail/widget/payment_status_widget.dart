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

          // ini ditampilkan jika dokter tidak bersedia
          if (appointmentData?.consultation?.doctorAvailable != true)
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
                  'Lihat Invoice',
                  style: regular14Grey400,
                ),
                const SizedBox(height: 12),
                Text(
                  appointmentData?.invoice ?? "-",
                  style: semiBold12Green500
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
                // jika dokter bersedia
                if (appointmentData?.consultation?.doctorAvailable == true) {
                  // jika pembayaran [TRANSFER MANUAL]
                  if (appointmentData?.consultation?.paymentMethod ==
                      PaymentMethod.transferManual) {
                    // jika user sudah berhasil bayar
                    if (appointmentData?.paymentStatus == PaymentStatus.done) {
                      return positive;

                      // jika user belum bayar
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

                  // jika dokter tidak bersedia
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
              // jika dokter bersedia
              if (appointmentData?.consultation?.doctorAvailable == true) {
                // jika pembayaran [TRANSFER MANUAL]
                if (appointmentData?.consultation?.paymentMethod ==
                    PaymentMethod.transferManual) {
                  // jika user sudah berhasil bayar
                  if (appointmentData?.paymentStatus == PaymentStatus.done) {
                    return 'Pembayaran Berhasil';

                    // jika user belum bayar
                  } else if (appointmentData?.paymentStatus ==
                      PaymentStatus.pending) {
                    return 'Menunggu Pembayaran';

                    // jika user refund
                  } else {
                    return 'Memproses Pengembalian Dana';
                  }

                  // jika pembayaran [DIKLINIK]
                } else {
                  return 'Janji Temu Berhasil';
                }

                // jika dokter tidak bersedia
              } else {
                return "Janji Temu Terunda";
              }

              //^ jika janji temu SELESAI
            } else if (appointmentData?.status == AppointmentStatus.selesai) {
              return "Janji Temu Berhasil";

              //^ jika janji temu BATAL
            } else {
              //* TRANSAKSI GAGAL
              // terjadi ketika status appointmentnya == cancelled
              // TAPI paymentStatusnya == pending
              if (appointmentData?.paymentStatus == PaymentStatus.pending) {
                return "Transaksi Gagal";

                //* JANJI TEMU DIBATALKAN
                // terjadi ketika status appointmentnya == cancelled
                // DAN paymentStatusnya == done/refund
              } else {
                return "Janji Temu Dibatalkan";
              }
            }
          }(),
          style: () {
            //^ jika janji temu DIPROSES
            if (appointmentData?.status == AppointmentStatus.menunggu ||
                appointmentData?.status == AppointmentStatus.proses) {
              // jika dokter bersedia
              if (appointmentData?.consultation?.doctorAvailable == true) {
                // jika pembayaran [TRANSFER MANUAL]
                if (appointmentData?.consultation?.paymentMethod ==
                    PaymentMethod.transferManual) {
                  // jika user berhasil bayar
                  if (appointmentData?.paymentStatus == PaymentStatus.done) {
                    return semiBold14Positive;

                    // jika user belum bayar
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

                // jika dokter tidak bersedia
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
