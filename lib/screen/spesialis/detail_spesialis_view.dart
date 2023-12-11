import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/card_doctor_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/spesialis/view_models.dart/detail_spesialis_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailSpesialisView extends StatelessWidget {
  const DetailSpesialisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    final String? specialistId = args;
    Provider.of<DetailSpesialisViewModel>(context, listen: false)
        .getDokterBySpecialist(specialistId: specialistId ?? '');

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
      body: Consumer<DetailSpesialisViewModel>(
        builder: (context, detailSpesialisViewModel, child) {
          final filteredDokterData =
              detailSpesialisViewModel.filteredDokterBySpecialist;
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: TextFormComponent(
                  controller: detailSpesialisViewModel.searchDokterController,
                  onChanged: (query) {
                    detailSpesialisViewModel.filterSearchDokter(query);
                  },
                  hintText: 'Cari Dokter Spesialis..',
                  hinstStyle: regular14Grey400,
                  prefixIcon: Icons.search,
                ),
              ),
              Expanded(
                child: filteredDokterData.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredDokterData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final doctor = filteredDokterData[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesNavigation.detailDokterView,
                                arguments: doctor,
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CardDoctorComponent(
                              imageUrl: doctor.profileImage ?? '',
                              doctorName: doctor.name ?? '',
                              doctorSpecialist: doctor.specialist?.name ?? '',
                              clinicsName: doctor.clinic?.name ?? '',
                              doctorPrice: doctor.price ?? 0,
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
    );
  }
}
