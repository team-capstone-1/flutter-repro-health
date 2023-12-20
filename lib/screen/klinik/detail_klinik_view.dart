import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/clinics_models/clinics_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailKlinikView extends StatelessWidget {
  const DetailKlinikView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResponseDataClinics;
    final ResponseDataClinics detailClinics = args;

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
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: detailClinics.image ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                      size: 60,
                    ),
                  ),
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
                        bottom: 16,
                      ),
                      child: Text(
                        detailClinics.name ?? '',
                        style: semiBold20Grey900,
                      ),
                    ),
                    Text(
                      "Informasi Klinik",
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
                              const Icon(
                                Icons.location_on_outlined,
                                size: 19,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  detailClinics.location ?? '-',
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
                                  Icons.phone,
                                  size: 19,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  detailClinics.telephone ?? '-',
                                  style: regular12Grey900,
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 19,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                detailClinics.email ?? '-',
                                style: regular12Grey900,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Profil',
                      style: semiBold14Grey900,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      detailClinics.profile ?? '',
                      style: regular12Grey900,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    ButtonComponent(
                      labelText: Text(
                        "Selanjutnya",
                        style: semiBold12Primary,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: green500,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation.searchKlinikView,
                          arguments: detailClinics,
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
