import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/appoinment/view_models/appoinment_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SpesialisAppoinmentWidget extends StatelessWidget {
  const SpesialisAppoinmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Berdasarkan Spesialis',
                style: semiBold14Grey900,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesNavigation.spesialisView,
                  );
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
              final filteredSpecialistData =
                  appoinmentViewModel.filteredspecialist;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredSpecialistData.length.clamp(0, 6),
                itemBuilder: (BuildContext context, int index) {
                  final specialist = filteredSpecialistData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesNavigation.detailSpesialisView,
                        arguments: specialist.id,
                      );
                    },
                    child: Card(
                      color: grey10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            imageUrl: specialist.image ?? '',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.error,
                              ),
                            ),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
