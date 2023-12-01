import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class KlinikAppoinmentWidget extends StatelessWidget {
  const KlinikAppoinmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Berdasarkan Klinik',
                style: semiBold14Grey900,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNavigation.klinikView);
                },
                child: Text(
                  'Lihat Semua',
                  style: regular12PrimaryGreen500,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<AppoinmentViewModel>(
            builder: (context, appoinmentViewModel, child) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: appoinmentViewModel.filteredDasboardKlinikData.length
                    .clamp(0, 2),
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
                              appoinmentViewModel
                                  .filteredDasboardKlinikData[index].image,
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
                                  appoinmentViewModel
                                      .filteredDasboardKlinikData[index]
                                      .namaRumahSakit,
                                  style: semiBold14Grey900,
                                ),
                                Text(
                                  appoinmentViewModel
                                      .filteredDasboardKlinikData[index].jalan,
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
                                      appoinmentViewModel
                                          .filteredDasboardKlinikData[index]
                                          .icon,
                                      size: 10,
                                      color: primarygreen500,
                                    ),
                                    Text(
                                      appoinmentViewModel
                                          .filteredDasboardKlinikData[index]
                                          .jarak,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
