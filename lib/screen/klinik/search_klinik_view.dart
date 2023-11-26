import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_dokter_widget.dart';
import 'package:reprohealth_app/screen/forum/widget/forum_widget_view.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_spesialis_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SearchKlinikView extends StatefulWidget {
  const SearchKlinikView({Key? key}) : super(key: key);

  @override
  State<SearchKlinikView> createState() => _SearchKlinikViewState();
}

class _SearchKlinikViewState extends State<SearchKlinikView> {
  @override
  void initState() {
    super.initState();
    filteredDokterList.addAll(dokterInterMedikaData);
    filteredSpesialisList.addAll(spesialisInterMedikaData);
  }

  void filterDokterList(String query) {
    filteredDokterList = dokterInterMedikaData
        .where((dokter) =>
            dokter.nama.toLowerCase().contains(query.toLowerCase()) ||
            dokter.spesialis.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  void filterSpesialisList(String query) {
    filteredSpesialisList = spesialisInterMedikaData
        .where((spesialis) =>
            spesialis.spesialis.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  int selectIndex = 0;
  final TextEditingController searchController = TextEditingController();
  List<DokterModels> filteredDokterList = [];
  List<SpesialisModels> filteredSpesialisList = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForumWidgetView(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Pilih Berdasarkan',
              style: semiBold16Primary4,
            ),
            elevation: 0,
            backgroundColor: grey10,
            iconTheme: IconThemeData(
              color: primary4,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: TextFormComponent(
                  controller: searchController,
                  onChanged: (value) {
                    if (selectIndex == 0) {
                      filterDokterList(value);
                    } else if (selectIndex == 1) {
                      filterSpesialisList(value);
                    }
                  },
                  hintText: 'Cari Dokter atau Spesialis',
                  prefixIcon: Icons.search,
                ),
              ),
              TabBar(
                labelStyle: medium14Grey400,
                labelColor: grey900,
                unselectedLabelColor: grey400,
                onTap: (int index) {
                  searchController.clear();
                  selectIndex = index;
                  setState(() {});
                },
                tabs: [
                  Tab(
                    child: Text(
                      'Dokter',
                      style: medium14Grey900,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Spesialis',
                      style: medium14Grey900,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: filteredDokterList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesNavigation.detailDokterView);
                          },
                          child: ListDokterWidget(
                            interMedika: filteredDokterList[index],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: ListSpesialisWidget(
                        spesialisInterMedikaList: filteredSpesialisList,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
