import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/models/spesialis_models.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/klinik/inter_medika/detail_page/tabbar/profile/profile_dokter1.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/klinik/inter_medika/detail_page/tabbar/tabbar_dokter_inter_medika.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/spesialis/andrologi_page.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/spesialis/bedah_reproduksi_page.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/spesialis/genetika_reproduksi_page.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/spesialis/kandungan_page.dart';
import 'package:reprohealth_app/screen/appoinment/page_widget/spesialis/psikologi_reproduksi_page.dart';
import 'package:reprohealth_app/screen/forum/widget/forum_widget_view.dart';
import 'package:reprohealth_app/theme/theme.dart';

class DetailInterMedika extends StatefulWidget {
  const DetailInterMedika({Key? key}) : super(key: key);

  @override
  State<DetailInterMedika> createState() => _DetailInterMedikaState();
}

class _DetailInterMedikaState extends State<DetailInterMedika> {
  void navigateToPageInterMedika(BuildContext context, int index) {
    List<Widget> pages = [
      const KandunganPage(),
      const GenetikareproduksiPage(),
      const AndrologiPage(),
      const PsikologiReproduksiPage(),
      const BedahReproduksiPage(),
    ];
    if (index >= 0 && index < pages.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pages[index],
        ),
      );
    }
  }

  void navigateToProfileDokter(int index) {
    List<Widget> pages = [
      const ProfileDokter1(),
    ];
    if (index >= 0 && index < pages.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pages[index],
        ),
      );
    }
  }

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
                  errortext: '',
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
                            navigateToProfileDokter(index);
                          },
                          child: TabbarDokterInterMedika(
                            interMedika: filteredDokterList[index],
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: filteredSpesialisList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              navigateToPageInterMedika(context, index);
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
                                    filteredSpesialisList[index].image,
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    filteredSpesialisList[index].spesialis,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
