import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/maps_models.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/screen/maps/maps_view_models/maps_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MapsView extends StatelessWidget {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    var getLocation = Provider.of<AppoinmentViewModel>(context, listen: false);
    Provider.of<MapsViewModel>(context, listen: false)
        .filteredMapsData
        .addAll(mapsData);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Pilih Lokasi',
            style: semiBold16Primary4,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Consumer<AppoinmentViewModel>(
        builder: (context, appoinmentViewModel, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 24,
                  bottom: 12,
                ),
                child: TextFormComponent(
                  controller: appoinmentViewModel.searchAppoinmentController,
                  onChanged: (query) {
                    appoinmentViewModel.filterSearchClinics(query);
                  },
                  hintText: 'Cari Lokasi..',
                  hinstStyle: semiBold12Green500,
                  prefixIcon: Icons.search,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: green500,
                    ),
                    Text(
                      getLocation.currentPosition?? "-",
                      style: regular12Grey400,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 14),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Expanded(
                child: appoinmentViewModel.filteredClinicsList.isNotEmpty
                    ? ListView.builder(
                        itemCount: appoinmentViewModel.filteredClinicsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final clinics = appoinmentViewModel.filteredClinicsList[index];
                          return GestureDetector(
                            onTap: () {
                              appoinmentViewModel.openMap(
                                double.parse(clinics.latitude?? "0.00"),
                                double.parse(clinics.longitude?? "0.00"),
                                );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: grey500,
                                  ),
                                ),
                                title: Text(
                                  appoinmentViewModel.filteredClinicsList[index].name?? "-",
                                  style: regular12Grey900,
                                ),
                                subtitle: Text(
                                  appoinmentViewModel.filteredClinicsList[index].location?? "-",
                                  style: regular8Grey400,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        },
                      )
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
          );
        },
      ),
    );
  }
}
