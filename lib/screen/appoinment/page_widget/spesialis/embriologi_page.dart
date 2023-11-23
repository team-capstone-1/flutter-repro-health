import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class EmbriologiPage extends StatefulWidget {
  const EmbriologiPage({super.key});

  @override
  State<EmbriologiPage> createState() => _EmbriologiPageState();
}

class _EmbriologiPageState extends State<EmbriologiPage> {
  TextEditingController searchEmbriologiController = TextEditingController();

  List<DokterModels> filteredDokterEmbriologiData = [];

// Add Data Embriologi
  @override
  void initState() {
    super.initState();
    filteredDokterEmbriologiData.addAll(dokterEmbriologiData);
  }

// Search Data Dokter Embriologi
  void filterSearchDokter(String query) {
    List<DokterModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = dokterEmbriologiData
          .where(
              (data) => data.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(dokterEmbriologiData);
    }

    setState(() {
      filteredDokterEmbriologiData = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: TextFormComponent(
              controller: searchEmbriologiController,
              errortext: '',
              onChanged: (query) {
                filterSearchDokter(query);
              },
              hintText: 'Cari Dokter Spesialis..',
              prefixIcon: Icons.search,
            ),
          ),
          Expanded(
            child: filteredDokterEmbriologiData.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredDokterEmbriologiData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              RoutesNavigation.appoinmentSpesialisView);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            color: grey10,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Image Dokter
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Flexible(
                                      child: SizedBox(
                                        height: 66,
                                        width: 66,
                                        child: Image.asset(
                                          filteredDokterEmbriologiData[index]
                                              .image,
                                          fit: BoxFit.cover,
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
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Nama Dokter
                                              Flexible(
                                                child: Text(
                                                  filteredDokterEmbriologiData[
                                                          index]
                                                      .nama,
                                                  style: medium14Grey500,
                                                ),
                                              ),

                                              // Tahun Pengalaman Dokter
                                              Flexible(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: primarygreen500),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 3,
                                                    ),
                                                    child: Text(
                                                      filteredDokterEmbriologiData[
                                                              index]
                                                          .tahun,
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
                                            filteredDokterEmbriologiData[index]
                                                .spesialis,
                                            style: regular12Grey400,
                                          ),
                                          const SizedBox(height: 16),

                                          // Nama Rumah Sakit dan Biaya
                                          Row(
                                            children: [
                                              Image.asset(
                                                filteredDokterEmbriologiData[
                                                        index]
                                                    .imageIcon,
                                                width: 16,
                                                height: 16,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                filteredDokterEmbriologiData[
                                                        index]
                                                    .rumahSakit,
                                                style: regular12Grey900,
                                              ),
                                              const Expanded(child: SizedBox()),
                                              Text(
                                                filteredDokterEmbriologiData[
                                                        index]
                                                    .biaya,
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
                          ),
                        ),
                      );
                    },
                  )

                // Icon dan Text Tidak Ditemukan
                : Padding(
                    padding: const EdgeInsets.only(top: 139),
                    child: Center(
                      child: ListView(
                        children: [
                          Image.asset(
                            'assets/search_tidak_ditemukan.png',
                            width: 176,
                            height: 183,
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Text(
                            'Tidak Ditemukan',
                            style: medium16Grey500,
                            textAlign: TextAlign.center,
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
