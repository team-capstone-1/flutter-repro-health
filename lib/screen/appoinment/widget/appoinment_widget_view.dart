import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/klinik_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

TextEditingController searchAppoinmentController = TextEditingController();

List<KlinikModels> filteredDasboardKlinikData = [];

final List<String> imageAssetsSpesialis = [
  'assets/foto_spesialis1.png',
  'assets/foto_spesialis2.png',
  'assets/foto_spesialis3.png',
  'assets/foto_spesialis4.png',
  'assets/foto_spesialis5.png',
  'assets/foto_spesialis6.png',
];

final List<String> itemTextSpesialis = [
  'Embriologi',
  'Kandungan',
  'Andrologi',
  'Fertilitas',
  'Ginekologi',
  'Obsteri',
];

// Location
Widget title(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Icon(
          Icons.location_on_outlined,
          color: primarygreen500,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesNavigation.mapsView);
          },
          child: Text(
            'Jakarta Pusat',
            style: regular12Grey400,
          ),
        ),
      ],
    ),
  );
}

// text Field Form
Widget textFieldAppoinment() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 16,
      bottom: 24,
      left: 16,
      right: 16,
    ),
    child: TextFormComponent(
      controller: searchAppoinmentController,
      hintText: 'Cari Spesialis, Klinik, Dokter',
      prefixIcon: Icons.search,
    ),
  );
}

// Spesialis Dasboard
Widget spesialisAppoinment(BuildContext context) {
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
                Navigator.pushNamed(context, RoutesNavigation.spesialisView);
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
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: imageAssetsSpesialis.length,
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
                      imageAssetsSpesialis[index],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      itemTextSpesialis[index],
                      style: medium12Grey900,
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
}

// Klinik Dasboard
Widget klinikAppoinment(BuildContext context) {
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
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: filteredDasboardKlinikData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesNavigation.detailKlinikView);
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
                        filteredDasboardKlinikData[index].image,
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
                            filteredDasboardKlinikData[index].namaRumahSakit,
                            style: semiBold14Grey900,
                          ),
                          Text(
                            filteredDasboardKlinikData[index].jalan,
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
                                filteredDasboardKlinikData[index].icon,
                                size: 10,
                                color: primarygreen500,
                              ),
                              Text(
                                filteredDasboardKlinikData[index].jarak,
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
      ),
    ],
  );
}
