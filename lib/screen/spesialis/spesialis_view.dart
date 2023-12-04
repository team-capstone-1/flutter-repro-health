import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/specialist_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SpesialisView extends StatelessWidget {
  const SpesialisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<SpecialistViewModels>(context, listen: false)
        .getSpecialistList();

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
      body: Consumer<SpecialistViewModels>(
        builder: (context, specialistViewModels, child) {
          final filteredSpecialistData =
              specialistViewModels.filteredspecialist;

          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: TextFormComponent(
                  controller:
                      specialistViewModels.searchSpecialistAppoinmentController,
                  hintText: 'Cari Dokter Spesialis..',
                  hinstStyle: regular14Grey400,
                  onChanged: (query) {
                    specialistViewModels.filterSearchSpecialist(query);
                  },
                  prefixIcon: Icons.search,
                ),
              ),
              filteredSpecialistData.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.assetsSearchTidakDitemukan,
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
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: filteredSpecialistData.length.clamp(0, 9),
                        itemBuilder: (BuildContext context, int index) {
                          final specialist = filteredSpecialistData[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesNavigation.detailSpesialisView,
                              );
                            },
                            child: Card(
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    specialist.image ?? '',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    specialist.name ?? '',
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
