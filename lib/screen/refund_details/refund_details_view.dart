import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/riwayat/view_model/riwayat_view_model.dart';

import 'package:reprohealth_app/theme/theme.dart';

class RefundDetailsView extends StatelessWidget {
  const RefundDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as Transaction;
    int indexDoctor = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengembalian Dana",
          style: semiBold16Grey700,
        ),
        backgroundColor: grey10,
        elevation: 0,
        iconTheme: IconThemeData(
          color: grey700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //^ STATUS REFUND
            Container(
              padding: const EdgeInsets.all(16),
              color: grey10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //^ Gambar Ilustrasi
                  Container(
                    color: grey100,
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
            ),
            const SizedBox(height: 4),

            //^ INFORMASI JANJI TEMU
            Container(
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
            ),
            const SizedBox(height: 4),

            //^ RINCIAN PEMBAYARAN
            Container(
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
            ),
          ],
        ),
      ),
      backgroundColor: grey50,
    );
  }
}
