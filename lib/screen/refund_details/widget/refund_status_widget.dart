import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';

class RefundStatusWidget extends StatelessWidget {
  const RefundStatusWidget({
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
          //^ Gambar Ilustrasi
          Container(
            color: Colors.grey.shade300,
            width: MediaQuery.of(context).size.width,
            height: 120,
          ),
          const SizedBox(height: 16),

          //^ Pengembalian Dana sedang diproses / berhasil
          Text(
            "Pengembalian Dana Sedang Diproses / Berhasil",
            style: semiBold16Green500,
          ),
          const SizedBox(height: 12),

          //^ Dana sebesar 85.000 akan dikembalikan / berhasil
          Text(
            "Dana sebesar ${RiwayatViewModel.convertToIdr(
              appointmentData.totalBill! - 5000,
              2,
            )} akan dikembalikan ke rekening Anda. Silahkan dicek secara berkala dalam 14 hari kerja",
            style: medium12Grey300,
          ),
        ],
      ),
    );
  }
}
