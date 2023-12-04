import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/screen/klinik/view_models/search_klinik_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ListDokterWidget extends StatelessWidget {
  const ListDokterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchKlinikViewModel>(
      builder: (context, searchKlinikViewModel, child) {
        final dokterList = searchKlinikViewModel.filteredDokter;
        return dokterList.isEmpty
            ? const Center(
                child: Text("Data tidak tersedia"),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: dokterList.length,
                  itemBuilder: (context, index) {
                    final dokter = dokterList[index];
                    return Card(
                      color: grey10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image Dokter
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Flexible(
                                child: SizedBox(
                                  height: 66,
                                  width: 66,
                                  child: CachedNetworkImage(
                                    imageUrl: dokter.profileImage ?? '',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Icon(
                                        Icons.error,
                                        size: 50,
                                      ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Nama Dokter
                                        Flexible(
                                          child: Text(
                                            dokter.name ?? '',
                                            style: medium14Grey500,
                                          ),
                                        ),

                                        // Tahun Pengalaman Dokter
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: green500,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 3,
                                              ),
                                              child: Text(
                                                "Belum API",
                                                style: regular8Green50,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),

                                    // Dokter Spesialis
                                    Text(
                                      dokter.specialist?.name ?? '',
                                      style: regular12Grey400,
                                    ),
                                    const SizedBox(height: 16),

                                    // Nama Rumah Sakit dan Biaya
                                    Row(
                                      children: [
                                        Image.asset(
                                          Assets.assetsKlinik,
                                          width: 16,
                                          height: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          dokter.clinic?.name ?? '',
                                          style: regular12Grey900,
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          dokter.price.toString(),
                                          style: medium12PrimaryGreen500,
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
                    );
                  },
                ),
              );
      },
    );
  }
}
