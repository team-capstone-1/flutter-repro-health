import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';

import 'package:reprohealth_app/theme/theme.dart';

class AppointmentInfoWidget extends StatelessWidget {
  const AppointmentInfoWidget({super.key, required this.appointmentData});

  final ResponseData? appointmentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: grey10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //^ JUDUL Informasi Janji Temu
          Text(
            "Informasi Janji Temu",
            style: semiBold14Grey500,
          ),
          const SizedBox(height: 16),

          //^ Nomer Urut
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nomer Urut",
                style: regular12Grey400,
              ),
              Text(
                appointmentData?.consultation?.queueNumber?.isNotEmpty == true
                    ? appointmentData?.consultation?.queueNumber.toString() ??
                        '-'
                    : "Belum Ada Nomor Antrian",
                style: semiBold12Green500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Klinik
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Klinik",
                style: regular12Grey400,
              ),
              Text(
                appointmentData?.consultation?.clinic?.name ?? "-",
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Lokasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Lokasi",
                  style: regular12Grey400,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  appointmentData?.consultation?.clinic?.location ?? "-",
                  style: semiBold12Grey500,
                  textAlign: TextAlign.right,
                ),
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
                appointmentData?.consultation?.doctor?.name ?? "-",
                style: semiBold12Grey500,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ Spesialis
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Spesialis",
                style: regular12Grey400,
              ),
              Text(
                appointmentData?.consultation?.doctor?.specialist ?? '-',
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
                DateFormat('d MMMM y', 'id_ID').format(
                  appointmentData?.consultation?.date ?? DateTime.now(),
                ),
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
                  text: appointmentData?.consultation?.session?.replaceAll(
                    appointmentData!.consultation!.session![0],
                    appointmentData!.consultation!.session![0].toUpperCase(),
                  ),
                  style: semiBold12Grey500,
                  children: [
                    TextSpan(
                      text: () {
                        if (appointmentData?.consultation?.session == 'pagi') {
                          return " (08.00 - 11.00)";
                        } else if (appointmentData?.consultation?.session ==
                            'siang') {
                          return " (13.00-15.30)";
                        } else {
                          return " (18.30-20.30)";
                        }
                      }(),
                      style: semiBold12Green500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
