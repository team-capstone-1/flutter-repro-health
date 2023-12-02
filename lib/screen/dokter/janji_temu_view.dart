import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/models/data_pemesanan_models.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/models/janji_temu_models.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_dokter_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JanjiTemuView extends StatelessWidget {
  const JanjiTemuView({super.key});

  @override
  Widget build(BuildContext context) {
    JanjiTemuModels janjiTemu = janjiTemuModels;
    DataPemesananModels dataPemesanan = dataPemesananModels;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Janji Temu Saya',
            style: semiBold16Grey500,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const SizedBox(
            height: 24,
          ),
          // Profil Dokter
          ListDokterWidget(
            interMedika: DokterModelsLama(
              image: 'assets/dr_nuke_spesialis.png',
              nama: 'Dr. Nuke Nugrahanti SpOG',
              spesialis: 'Dokter Kandungan',
              imageIcon: 'assets/klinik.png',
              rumahSakit: 'Inter Medika',
              tahun: '5 tahun',
              biaya: '70.000',
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 12,
              bottom: 24,
            ),
            child: Divider(
              thickness: 1,
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jadwal Janji Temu',
              style: medium14Grey900,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal',
                    style: regular12Grey400,
                  ),
                  Text(
                    janjiTemu.tanggal,
                    style: semiBold12Grey500,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sesi',
                    style: regular12Grey400,
                  ),
                  RichText(
                    text: TextSpan(
                      text: (janjiTemu.sesi).replaceAll(
                        RegExp(r'[().0-9-]'),
                        '',
                      ),
                      style: semiBold12Grey500,
                      children: [
                        TextSpan(
                          text: (janjiTemu.sesi).replaceAll(
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
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Lokasi',
                      style: regular12Grey400,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      janjiTemu.lokasi,
                      style: semiBold12Grey500,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              thickness: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Data Pemesanan',
              style: medium14Grey900,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nama',
                    style: regular12Grey400,
                  ),
                  Text(
                    dataPemesanan.nama,
                    style: semiBold12Grey500,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jenis Kelamin',
                    style: regular12Grey400,
                  ),
                  Text(
                    dataPemesanan.jenisKelamin,
                    style: semiBold12Grey500,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nomor Ponsel',
                    style: regular12Grey400,
                  ),
                  Text(
                    dataPemesanan.nomorPonsel,
                    style: semiBold12Grey500,
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 100),
            child: Divider(
              thickness: 1,
            ),
          ),
          ButtonComponent(
            labelText: 'Pilih Metode Pembayaran',
            labelStyle: semiBold12Grey10,
            backgroundColor: green500,
            onPressed: () {},
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
