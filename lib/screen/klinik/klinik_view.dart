import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/klinik/view_models/clinics_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class KlinikView extends StatelessWidget {
  const KlinikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ClinicsViewModel>(context, listen: false).getClinicsList();

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
      body: Consumer<ClinicsViewModel>(
        builder: (context, clinicsViewModel, child) {
          final filteredClinicsData = clinicsViewModel.filteredClinicsList;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
                TextFormComponent(
                  controller: clinicsViewModel.searchKlinikAppoinmentController,
                  onChanged: (query) {
                    clinicsViewModel.filterSearchClinics(query);
                  },
                  hintText: 'Cari Dokter Spesialis..',
                  hinstStyle: regular14Grey400,
                  prefixIcon: Icons.search,
                ),
                filteredClinicsData == null
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
                          ],
                        ),
                      )
                    : const SizedBox(
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
                  itemCount: filteredClinicsData?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final clinics = filteredClinicsData?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation.detailKlinikView,
                          arguments: clinics,
                        );
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
                              child: CachedNetworkImage(
                              imageUrl: clinics?.image ?? '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Center(child: Icon(Icons.error, size: 50,),),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    clinics?.name ?? '',
                                    style: semiBold14Grey900,
                                  ),
                                  Text(
                                    clinics?.location ?? '',
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
                                        Icons.location_on_outlined,
                                        size: 10,
                                        color: green500,
                                      ),
                                      Text(
                                        "5 Meter",
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
