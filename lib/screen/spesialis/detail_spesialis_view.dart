import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/detail_spesialis_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailSpesialisView extends StatelessWidget {
  const DetailSpesialisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DetailSpesialisViewModel>(context, listen: false)
        .getDokterList();

    return Scaffold(
      backgroundColor: grey10,
      appBar: AppBar(
        title: Text(
          'Dokter',
          style: semiBold16Primary4,
        ),
        elevation: 0,
        backgroundColor: grey10,
        iconTheme: IconThemeData(color: primary4),
      ),
      body: ChangeNotifierProvider(
        create: (context) => DetailSpesialisViewModel(),
        child: Consumer<DetailSpesialisViewModel>(
          builder: (context, detailSpesialisViewModel, child) {
            final filteredDokterKandunganData =
                detailSpesialisViewModel.filteredDokterKandunganData;

            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: TextFormComponent(
                    controller:
                        detailSpesialisViewModel.searchKandunganController,
                    onChanged: (query) {
                      detailSpesialisViewModel.filterSearchDokter(query);
                    },
                    hintText: 'Cari Dokter Spesialis..',
                    hinstStyle: regular14Grey400,
                    prefixIcon: Icons.search,
                  ),
                ),
                Expanded(
                  child: filteredDokterKandunganData.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredDokterKandunganData.length
                              .clamp(0, 3),
                          itemBuilder: (BuildContext context, int index) {
                            final dokter =
                                filteredDokterKandunganData[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesNavigation.detailDokterView);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Card(
                                  color: grey10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Flexible(
                                            child: SizedBox(
                                              height: 66,
                                              width: 66,
                                              child: ClipOval(
                                                child: Image.network(
                                                  dokter.profileImage ?? '',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Flexible(
                                          child: SizedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        dokter.name ?? '',
                                                        style: medium14Grey500,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                4),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(4),
                                                            color: green500),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 8,
                                                            vertical: 3,
                                                          ),
                                                          child: Text(
                                                            '5 Tahun',
                                                            style:
                                                                regular8Green50,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  dokter.specialist?.name ?? '',
                                                  style: regular12Grey400,
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      Assets.assetsIconKlinik,
                                                      width: 16,
                                                      height: 16,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      dokter.clinic?.name ?? '',
                                                      style: regular12Grey900,
                                                    ),
                                                    const Expanded(
                                                        child: SizedBox()),
                                                    Text(
                                                      dokter.price.toString(),
                                                      style:
                                                          medium12PrimaryGreen500,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.assetsSearchTidakDitemukan,
                                width: 176,
                                height: 183,
                              ),
                              const SizedBox(height: 29),
                              Text(
                                'Tidak Ditemukan',
                                style: medium16Grey500,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
