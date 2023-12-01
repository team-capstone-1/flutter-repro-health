import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';

class PaymentDetailWidget extends StatelessWidget {
  const PaymentDetailWidget({
    super.key,
    required this.appointmentData,
  });

  final Transaction appointmentData;

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
            children: [
              Text(
                "Metode Pembayaran",
                style: regular12Grey500,
              ),
              Text(
                appointmentData.paymentMethod ?? "-",
                style: semiBold12Grey500,
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
                RiwayatViewModel.convertToIdr(appointmentData.price, 2),
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
                RiwayatViewModel.convertToIdr(appointmentData.adminFee, 2),
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
                RiwayatViewModel.convertToIdr(appointmentData.totalBill, 2),
                style: semiBold12Grey500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
