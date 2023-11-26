import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/profile_dokter_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailDokterView extends StatelessWidget {
  const DetailDokterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: primary4),
            backgroundColor: primary,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                child: Image.asset(
                  'assets/foto_klinik3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            profilDokter1Data[0].namaDokter,
                            style: semiBold16Grey900,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                3,
                              ),
                              color: primarygreen500,
                            ),
                            child: Text(
                              '5 Tahun',
                              style: regular8Green50,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 16,
                      ),
                      child: Text(profilDokter1Data[0].spesialis),
                    ),
                    Text(
                      'Informasi Dokter',
                      style: semiBold14Grey900,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icon_klinik.png',
                                width: 15,
                                height: 15,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  profilDokter1Data[0].namaKlinik,
                                  style: regular12Grey900,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  profilDokter1Data[0].jalan,
                                  style: regular12Grey900,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/price.png',
                                width: 15,
                                height: 15,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                profilDokter1Data[0].harga,
                                style: medium12PrimaryGreen500,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Pendidikan',
                      style: semiBold14Grey900,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      profilDokter1Data[0].isiPendidikan,
                      style: regular12Grey900,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Riwayat Pekerjaan',
                      style: semiBold14Grey900,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      profilDokter1Data[0].isiPekerjaan,
                      style: regular12Grey900,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: ButtonComponent(
                        labelText: 'Jadwalkan',
                        labelStyle: semiBold12Primary,
                        backgroundColor: primarygreen500,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesNavigation.jadwalDokterView);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
