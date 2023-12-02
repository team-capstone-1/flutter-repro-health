import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/screen/klinik/view_models/klinik_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class KlinikView extends StatelessWidget {
  const KlinikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<KlinikViewModel>(context, listen: false)
        .filteredKlinikData
        .addAll(klinikModelsData);

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
      body: Consumer<KlinikViewModel>(
        builder: (context, klinikViewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                TextFormComponent(
                  controller: klinikViewModel.searchKlinikAppoinmentController,
                  onChanged: (query) {
                    klinikViewModel.filterSearchDokter(query);
                  },
                  hintText: 'Cari Dokter Spesialis..',
                  hinstStyle: regular14Grey400,
                  prefixIcon: Icons.search,
                ),
                if (!klinikViewModel.hasSearchResults)
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
                  itemCount: klinikViewModel.filteredKlinikData.length,
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
                                klinikViewModel.filteredKlinikData[index].image,
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
                                    klinikViewModel.filteredKlinikData[index]
                                        .namaRumahSakit,
                                    style: semiBold14Grey900,
                                  ),
                                  Text(
                                    klinikViewModel
                                        .filteredKlinikData[index].jalan,
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
                                        klinikViewModel
                                            .filteredKlinikData[index].icon,
                                        size: 10,
                                        color: green500,
                                      ),
                                      Text(
                                        klinikViewModel
                                            .filteredKlinikData[index].jarak,
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
          );
        },
      ),
    );
  }
}
