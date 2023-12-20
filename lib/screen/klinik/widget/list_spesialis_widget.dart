import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/klinik/view_models/search_klinik_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ListSpesialisWidget extends StatelessWidget {
  const ListSpesialisWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchKlinikViewModel>(
        builder: (context, searchKlinikViewModel, child) {
      final specialistList = searchKlinikViewModel.filteredSpecialist;
      return specialistList.isEmpty
          ? const Center(
              child: Text("Data tidak tersedia"),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: specialistList.length.clamp(0, 5),
                itemBuilder: (context, index) {
                  final specialist = specialistList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesNavigation.detailSpesialisView,
                        arguments: specialist.id,
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
            );
    });
  }
}
