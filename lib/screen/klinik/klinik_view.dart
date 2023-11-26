import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class KlinikView extends StatefulWidget {
  const KlinikView({Key? key}) : super(key: key);

  @override
  State<KlinikView> createState() => _KlinikViewState();
}

class _KlinikViewState extends State<KlinikView> {
  TextEditingController searchKlinikAppoinmentController =
      TextEditingController();

  List<KlinikModels> filteredKlinikData = [];
  bool hasSearchResults = true;

  @override
  void initState() {
    super.initState();
    filteredKlinikData.addAll(klinikModelsData);
  }

  void filterSearchDokter(String query) {
    List<KlinikModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = klinikModelsData
          .where((data) =>
              data.namaRumahSakit.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(klinikModelsData);
    }

    setState(() {
      filteredKlinikData = searchResults;
      hasSearchResults = searchResults.isNotEmpty;
    });
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
            'Klinik',
            style: semiBold16Primary4,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            TextFormComponent(
              controller: searchKlinikAppoinmentController,
              onChanged: (query) {
                filterSearchDokter(query);
              },
              hintText: 'Cari Dokter Spesialis..',
              prefixIcon: Icons.search,
            ),
            if (!hasSearchResults)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 24,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredKlinikData.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RoutesNavigation.detailKlinikView);
                  },
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            filteredKlinikData[index].image,
                            width: double.infinity,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredKlinikData[index].namaRumahSakit,
                                style: semiBold14Grey900,
                              ),
                              Text(
                                filteredKlinikData[index].jalan,
                                style: regular10Grey900,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    filteredKlinikData[index].icon,
                                    size: 10,
                                    color: primarygreen500,
                                  ),
                                  Text(
                                    filteredKlinikData[index].jarak,
                                    style: regular8Grey400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
