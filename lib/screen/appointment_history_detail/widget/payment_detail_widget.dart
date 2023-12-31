import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/appointment_status.dart';
import 'package:reprohealth_app/constant/payment_method.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class PaymentDetailWidget extends StatelessWidget {
  const PaymentDetailWidget({
    super.key,
    required this.appointmentData,
  });

  final ResponseData? appointmentData;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RiwayatViewModel>(
      context,
      listen: false,
    );
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      color: grey10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ JUDUL Rincian Pembayaran
          Text(
            "Rincian Pembayaran",
            style: semiBold14Grey500,
          ),
          const SizedBox(height: 16),
          //^ Metode Pembayaran
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Metode Pembayaran",
                style: regular12Grey500,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    () {
                      // jika user bayar [TRANSFER MANUAL]
                      if (appointmentData?.consultation?.paymentMethod ==
                          PaymentMethod.transferManual) {
                        return "Transfer Manual";

                        // jika user bayar [DIKLINIK]
                      } else {
                        return "Bayar Diklinik";
                      }
                    }(),
                    style: semiBold12Grey500,
                    textAlign: TextAlign.right,
                  ),
                  Visibility(
                    visible:
                        appointmentData?.status == AppointmentStatus.selesai,
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height / 4,
                                  horizontal: 16,
                                ),
                                child: Image.network(
                                  appointmentData?.payment?.first.image ?? '-',
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Lihat bukti pembayaran",
                          style: semiBold10Green500,
                        )),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Harga
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harga",
                style: regular12Grey500,
              ),
              Text(
                controller.convertToIdr(
                  appointmentData?.price,
                  2,
                ),
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Admin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Admin",
                style: regular12Grey500,
              ),
              Text(
                controller.convertToIdr(
                  appointmentData?.adminPrice,
                  2,
                ),
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Total Tagihan
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Harga",
                style: semiBold14Grey500,
              ),
              Text(
                controller.convertToIdr(
                  appointmentData?.total,
                  2,
                ),
                style: semiBold14Green500,
              )
            ],
          ),
          const SizedBox(height: 8),

          Text('*Harga yang harus dibayarkan', style: regular10Grey400),
        ],
      ),
    );
  }
}
