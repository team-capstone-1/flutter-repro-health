import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RefundDetailWidget extends StatelessWidget {
  const RefundDetailWidget({
    super.key,
    required this.appointmentData,
  });

  final Transaction appointmentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(16),
      color: grey10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ JUDUL Rincian Pengembalian
          Text(
            "Rincian Pengembalian",
            style: semiBold14Grey500,
          ),
          const SizedBox(height: 16),

          //^ Tagihan Awal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tagihan Awal",
                style: regular12Grey500,
              ),
              Text(
                RiwayatViewModel.convertToIdr(
                  appointmentData.totalBill,
                  2,
                ),
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
                style: semiBold14Grey500,
              ),
              Text(
                RiwayatViewModel.convertToIdr(
                  appointmentData.totalBill! - 5000,
                  2,
                ),
                style: semiBold12Green500,
              ),
            ],
          ),
          const SizedBox(height: 8),

          //^ *Harga refund
          Text(
            "*Harga refund termasuk biaya penanganan pengembalian dana",
            style: regular10Grey200,
          ),
        ],
      ),
    );
  }
}
