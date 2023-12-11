import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget({
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
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appointmentData?.consultation?.doctor?.name ?? '-',
            style: semiBold16Grey500,
          ),
          const SizedBox(height: 8),
          Text(
            appointmentData?.consultation?.doctor?.specialist ?? '-',
            style: regular12Grey300,
          ),
          const SizedBox(height: 16),

          //^ Informasi dokter
          Text(
            "Informasi Dokter",
            style: semiBold14Grey500,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.local_hospital_outlined,
                color: Color(0xFF686868),
              ),
              const SizedBox(width: 4),
              Text(
                appointmentData?.consultation?.clinic?.name ?? '-',
                style: regular12Grey300,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF686868),
              ),
              const SizedBox(width: 4),
              Text(
                appointmentData?.consultation?.clinic?.location ?? '-',
                style: regular12Grey300,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.attach_money_outlined,
                color: Color(0xFF686868),
              ),
              const SizedBox(width: 4),
              Text(
                controller.convertToIdr(
                  appointmentData?.price,
                  2,
                ),
                style: medium12Green500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
