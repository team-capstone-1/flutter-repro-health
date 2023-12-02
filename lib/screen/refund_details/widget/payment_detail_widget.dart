import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';

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
                style: regular12Grey400,
              ),
              Text(
                appointmentData.paymentMethod ?? '-',
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Harga Pengembalian
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harga Pengembalian",
                style: regular12Grey400,
              ),
              Text(
                RiwayatViewModel.convertToIdr(
                  appointmentData.totalBill! - 5000,
                  2,
                ),
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Diminta Oleh
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Diminta Oleh",
                style: regular12Grey400,
              ),
              Text(
                "Antoni Julio",
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Diminta Pada
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Diminta Pada",
                style: regular12Grey400,
              ),
              Text(
                "11-11-2023 12.30",
                style: semiBold12Grey500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
