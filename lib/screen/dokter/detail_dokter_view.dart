import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailDokterView extends StatelessWidget {
  const DetailDokterView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResponseDataDoctor;
    final ResponseDataDoctor detailDoctor = args;

    return Scaffold(
      body: Column(
        children: [
          CustomScrollView(
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: detailDoctor.profileImage ?? '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          detailDoctor.name ?? '',
                          style: semiBold16Grey900,
                        ),
                        Container(
                          padding: const EdgeInsets.all(
                            8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              3,
                            ),
                            color: green500,
                          ),
                          child: Text(
                            '5 Tahun',
                            style: regular8Green50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Dokter ${detailDoctor.specialist?.name}",
                      style: regular12Grey400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Informasi Dokter',
                      style: semiBold14Grey900,
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Assets.assetsIconKlinik,
                              width: 15,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                detailDoctor.clinic?.name ?? '',
                                style: regular12Grey900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              detailDoctor.clinic?.location ?? '',
                              style: regular12Grey900,
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Image.asset(
                              Assets.assetsPrice,
                              width: 15,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              detailDoctor.price.toString(),
                              style: medium12Green500,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Pendidikan',
                      style: semiBold14Grey900,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    detailDoctor.educations?.isNotEmpty == true
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: detailDoctor.educations?.length,
                            itemBuilder: (context, index) {
                              final education = detailDoctor.educations?[index];
                              return Text(
                                "${index + 1}. ${education?.university} - ${education?.educationProgram}",
                                style: regular12Grey900,
                                textAlign: TextAlign.justify,
                              );
                            },
                          )
                        : Text(
                            "Belum terdapat riwayat pendidikan",
                            style: regular12Grey900,
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
                    detailDoctor.educations?.isNotEmpty == true
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: detailDoctor.workHistories?.length,
                            itemBuilder: (context, index) {
                              final workHistory =
                                  detailDoctor.workHistories?[index];
                              return Text(
                                "${index + 1}. ${workHistory?.workplace} - ${workHistory?.position}",
                                style: regular12Grey900,
                                textAlign: TextAlign.justify,
                              );
                            },
                          )
                        : Text(
                            "Belum terdapat riwayat perkerjaan",
                            style: regular12Grey900,
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                    ButtonComponent(
                      labelText: 'Jadwalkan',
                      labelStyle: semiBold12Primary,
                      backgroundColor: green500,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation.jadwalDokterView,
                          arguments: detailDoctor,
                        );
                      },
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
