import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/card_doctor_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/klinik/view_models/search_klinik_view_model.dart';
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
                    final doctor = dokterList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNavigation.detailDokterView,
                          arguments: doctor,
                        );
                      },
                      child: CardDoctorComponent(
                        imageUrl: doctor.profileImage ?? '',
                        doctorName: doctor.name ?? '',
                        doctorSpecialist: doctor.specialist?.name ?? '',
                        clinicsName: doctor.clinic?.name ?? '',
                        doctorPrice: doctor.price ?? 0,
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
