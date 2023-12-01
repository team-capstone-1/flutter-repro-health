import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/spesialis_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SpesialisView extends StatelessWidget {
  const SpesialisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SpesialisViewModel>(context, listen: false)
        .filteredSpesialisData
        .addAll(spesialisModelsData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Spesialis',
            style: semiBold16Primary4,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Consumer<SpesialisViewModel>(
        builder: (context, spesialisViewModel, child) {
          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: TextFormComponent(
                  controller:
                      spesialisViewModel.searchSpesialisAppoinmentController,
                  hintText: 'Cari Dokter Spesialis..',
                  onChanged: (query) {
                    spesialisViewModel.filterSearchSpesialis(query);
                  },
                  prefixIcon: Icons.search,
                ),
              ),
              if (!spesialisViewModel.hasSearchResults)
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: spesialisViewModel.filteredSpesialisData.length
                      .clamp(0, 9),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesNavigation.detailSpesialisView);
                      },
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              spesialisViewModel
                                  .filteredSpesialisData[index].image,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              spesialisViewModel
                                  .filteredSpesialisData[index].spesialis,
                              style: medium12Grey900,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
