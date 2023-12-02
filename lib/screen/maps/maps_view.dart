import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/maps_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  TextEditingController searchMapsController = TextEditingController();

  List<MapsModels> filteredMapsData = [];

  @override
  void initState() {
    super.initState();
    filteredMapsData.addAll(mapsData);
  }

  void filterSearchMaps(String query) {
    List<MapsModels> searchResults = [];

    if (query.isNotEmpty) {
      searchResults = mapsData
          .where((data) =>
              data.namaStasiun.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults.addAll(mapsData);
    }

    setState(() {
      filteredMapsData = searchResults;
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
            'Pilih Lokasi',
            style: semiBold16Primary4,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 24,
              bottom: 12,
            ),
            child: TextFormComponent(
              controller: searchMapsController,
              onChanged: (query) {
                filterSearchMaps(query);
              },
              hintText: 'Cari Lokasi..',
              hinstStyle: regular14Grey400,
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
                  'Jakarta Pusat',
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
            child: filteredMapsData.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredMapsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              filteredMapsData[index].icon,
                              color: grey500,
                            ),
                          ),
                          title: Text(
                            filteredMapsData[index].namaStasiun,
                            style: regular12Grey900,
                          ),
                          subtitle: Text(
                            filteredMapsData[index].jalan,
                            style: regular8Grey400,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
