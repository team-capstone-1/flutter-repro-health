import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class RefundDetailWidget extends StatelessWidget {
  const RefundDetailWidget({
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

    return Container(
      padding: const EdgeInsets.all(16),
      color: grey10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ Rincian Pengembalian
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
                style: regular12Grey400,
              ),
              Text(
                controller.convertToIdr(appointmentData?.total, 2),
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Tagihan Awal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harga Pengembalian",
                style: semiBold14Grey500,
              ),
              Text(
                "${controller.convertToIdr(
                  appointmentData!.total! - 5000,
                  2,
                )}*",
                style: semiBold14Green500,
              ),
            ],
          ),
          const SizedBox(height: 8),

          //^Harga Refund Termasuk Biaya Penanganan
          Text(
            "*Harga refund termasuk biaya penanganan pengembalian dana",
            style: regular10Grey200,
          ),
        ],
      ),
    );
  }
}
