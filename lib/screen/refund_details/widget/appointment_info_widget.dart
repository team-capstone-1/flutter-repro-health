import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class AppointmentInfoWidget extends StatelessWidget {
  const AppointmentInfoWidget({
    super.key,
    required this.appointmentData,
    required this.indexDoctor,
  });

  final Transaction appointmentData;
  final int indexDoctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey10,
      child: ExpansionTile(
        title: Text(
          "Informasi Janji Temu",
          style: semiBold14Grey500,
        ),
        iconColor: grey500,
        controlAffinity: ListTileControlAffinity.trailing,
        expandedAlignment: Alignment.topLeft,
        childrenPadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        children: [
          //^ Nomer Urut
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nomer Urut",
                style: regular12Grey400,
              ),
              Text(
                (appointmentData.queueNumber ?? 0).toString(),
                style: semiBold12Green500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Dokter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dokter",
                style: regular12Grey400,
              ),
              Text(
                appointmentData.doctor?[indexDoctor].name ?? '-',
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Tanggal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tanggal",
                style: regular12Grey400,
              ),
              Text(
                appointmentData.appointmentDate ?? '-',
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Sesi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sesi",
                style: regular12Grey400,
              ),
              RichText(
                text: TextSpan(
                  text: (appointmentData.session!).replaceAll(
                    RegExp(r'[().0-9-]'),
                    '',
                  ),
                  style: semiBold12Grey500,
                  children: [
                    TextSpan(
                      text: (appointmentData.session!).replaceAll(
                        RegExp(r'[a-zA-Z]'),
                        '',
                      ),
                      style: semiBold12Green500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Lokasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lokasi",
                style: regular12Grey400,
              ),
              Text(
                appointmentData.location ?? '-',
                style: semiBold12Grey500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
