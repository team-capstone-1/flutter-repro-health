import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/screen/klinik/view_models/search_klinik_view_model.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_dokter_widget.dart';
import 'package:reprohealth_app/screen/klinik/widget/list_spesialis_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class SearchKlinikView extends StatelessWidget {
  const SearchKlinikView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: Consumer<SearchKlinikViewModel>(
          builder: (context, searchKlinikViewModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: TextFormComponent(
                    controller: searchKlinikViewModel.searchController,
                    onChanged: (value) {
                      if (searchKlinikViewModel.selectIndex == 0) {
                        searchKlinikViewModel.filterDokterList(value);
                      } else if (searchKlinikViewModel.selectIndex == 1) {
                        searchKlinikViewModel.filterSpesialisList(value);
                      }
                    },
                    hintText: 'Cari Dokter atau Spesialis',
                    hinstStyle: regular14Grey400,
                    prefixIcon: Icons.search,
                  ),
                ),
                TabBar(
                  labelStyle: medium14Grey400,
                  labelColor: grey900,
                  unselectedLabelColor: grey400,
                  onTap: (int index) {
                    searchKlinikViewModel.searchController.clear();
                    searchKlinikViewModel.selectIndex = index;
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
                        itemCount:
                            searchKlinikViewModel.filteredDokterList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesNavigation.detailDokterView);
                            },
                            child: ListDokterWidget(
                              interMedika: searchKlinikViewModel
                                  .filteredDokterList[index],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        child: ListSpesialisWidget(
                          spesialisInterMedikaList:
                              searchKlinikViewModel.filteredSpesialisList,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
