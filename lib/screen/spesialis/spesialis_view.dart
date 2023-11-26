import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SpesialisView extends StatefulWidget {
  const SpesialisView({Key? key}) : super(key: key);

  @override
  State<SpesialisView> createState() => _SpesialisView();
}

class _SpesialisView extends State<SpesialisView> {
  late TextEditingController searchSpesialisAppoinmentController;
  List<SpesialisModels> filteredSpesialisData = [];
  bool hasSearchResults = true;

  @override
  void initState() {
    super.initState();
    searchSpesialisAppoinmentController = TextEditingController();
    filteredSpesialisData.addAll(spesialisModelsData);
  }

  void filterSearchSpesialis(String query) {
    List<SpesialisModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = spesialisModelsData
          .where((data) =>
              data.spesialis.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(spesialisModelsData);
    }

    setState(() {
      filteredSpesialisData = searchResults;
      hasSearchResults = searchResults.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: TextFormComponent(
              controller: searchSpesialisAppoinmentController,
              hintText: 'Cari Dokter Spesialis..',
              onChanged: (query) {
                filterSearchSpesialis(query);
              },
              prefixIcon: Icons.search,
            ),
          ),
          if (!hasSearchResults)
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
              itemCount: filteredSpesialisData.length,
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
                          filteredSpesialisData[index].image,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          filteredSpesialisData[index].spesialis,
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
      ),
    );
  }
}
