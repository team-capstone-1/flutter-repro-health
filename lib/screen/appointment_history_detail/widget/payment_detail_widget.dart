import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/payment_method.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

class PaymentDetailWidget extends StatelessWidget {
  const PaymentDetailWidget({
    super.key,
    required this.appointmentData,
  });

  final ResponseData? appointmentData;

  @override
  Widget build(BuildContext context) {
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
              Flexible(
                child: Text(
                  "Metode Pembayaran",
                  style: regular12Grey500,
                ),
              ),
              Flexible(
                child: Text(
                  () {
                    if (appointmentData?.payment?.isNotEmpty == true) {
                      if (appointmentData?.payment?.first.method ==
                          PaymentMethod.transferManual) {
                        return "Transfer Manual";
                      } else {
                        return "Bayar Diklinik";
                      }
                    } else {
                      return "Anda Belum Memilih Metode Pembayaran";
                    }
                  }(),
                  style: semiBold12Grey500,
                  textAlign: TextAlign.right,
                ),
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
                Provider.of<RiwayatViewModel>(context).convertToIdr(
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
                Provider.of<RiwayatViewModel>(context).convertToIdr(
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
                style: regular12Grey500,
              ),
              Text(
                Provider.of<RiwayatViewModel>(context).convertToIdr(
                  appointmentData?.total,
                  2,
                ),
                style: semiBold12Grey500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
