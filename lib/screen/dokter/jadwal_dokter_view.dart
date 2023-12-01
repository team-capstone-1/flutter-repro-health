import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/screen/dokter/widget/pilih_sesi_widget.dart';
import 'package:reprohealth_app/screen/dokter/widget/pilih_tanggal_widget.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_dokter_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JadwalDokterView extends StatefulWidget {
  const JadwalDokterView({Key? key}) : super(key: key);

  @override
  State<JadwalDokterView> createState() => JadwalDokterViewState();
}

class JadwalDokterViewState extends State<JadwalDokterView> {
  List<String> pemesan = [
    "Ridho Firmansyah",
    "Rifat Hasta",
  ];

  late int selectedPemesan;
  // late String selectedSession;

  @override
  void initState() {
    super.initState();
    // selectedSession = '';
    selectedPemesan = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Jadwalkan',
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
          const SizedBox(
            height: 24,
          ),

          // Form Pilih Tanggal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Tanggal',
                style: semiBold14Grey900,
              ),
              const SizedBox(
                height: 16,
              ),

              //  Pilih Tanggal
              const PilihTanggalWidget(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Pilih Sesi',
                style: semiBold14Grey900,
              ),
              const SizedBox(
                height: 16,
              ),

              // Form Pilih Sesi
              const PilihSesiWidget(),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          // Button Component
          ButtonComponent(
            labelText: 'Lanjut ke Data Pemesanan',
            labelStyle: semiBold12Grey10,
            backgroundColor: primarygreen500,
            onPressed: () {
              // Bottom Sheet
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Pilih Profil Pasien',
                                style: semiBold14Grey900,
                              ),
                              const SizedBox(
                                height: 16,
                              ),

                              // Diri Sendiri
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Diri Sendiri',
                                  style: regular14Grey400,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        selectedPemesan = 0;
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 12,
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            'https://glints.com/id/lowongan/wp-content/uploads/2022/04/cara-mengambil-foto-profesional-5.jpg',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        pemesan[0],
                                      ),
                                      const Spacer(),
                                      Radio(
                                        activeColor: primarygreen500,
                                        value: 0,
                                        groupValue: selectedPemesan,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPemesan = value as int;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),

                              // Anggota Keluarga
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Anggota Keluarga',
                                  style: regular14Grey400,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedPemesan = 1;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 12,
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            'https://glints.com/id/lowongan/wp-content/uploads/2022/04/cara-mengambil-foto-profesional-5.jpg',
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        pemesan[1],
                                      ),
                                      const Spacer(),
                                      Radio(
                                        activeColor: primarygreen500,
                                        value: 1,
                                        groupValue: selectedPemesan,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              selectedPemesan = value as int;
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 36,
                              ),

                              // Button Component
                              ButtonComponent(
                                labelText: 'Selanjutnya',
                                labelStyle: semiBold12Grey10,
                                backgroundColor: primarygreen500,
                                onPressed: () {
                                  // String selectedProfile =
                                  //     pemesan[selectedPemesanIndex];
                                  Navigator.pushNamed(
                                    context,
                                    RoutesNavigation.janjiTemuView,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
