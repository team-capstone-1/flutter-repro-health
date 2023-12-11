import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_sesi_view_model.dart';
import 'package:reprohealth_app/screen/dokter/view_models/pilih_tanggal_view_model.dart';
import 'package:reprohealth_app/screen/dokter/widget/pilih_sesi_widget.dart';
import 'package:reprohealth_app/screen/dokter/widget/pilih_tanggal_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JadwalDokterView extends StatefulWidget {
  const JadwalDokterView({Key? key}) : super(key: key);

  @override
  State<JadwalDokterView> createState() => JadwalDokterViewState();
}

class JadwalDokterViewState extends State<JadwalDokterView> {
  late int selectedPemesan;

  @override
  void initState() {
    super.initState();
    selectedPemesan = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () {
      Provider.of<JanjiTemuViewModel>(context, listen: false)
          .getProfile(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ResponseDataDoctor;
    final ResponseDataDoctor detailDoctor = args;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Jadwalkan',
            style: semiBold16Grey500,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const SizedBox(
            height: 24,
          ),
          Card(
            color: grey10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image Dokter
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 66,
                      width: 66,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: detailDoctor.profileImage ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.error,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama Dokter
                              Flexible(
                                child: Text(
                                  detailDoctor.name ?? '',
                                  style: medium14Grey500,
                                ),
                              ),

                              // Tahun Pengalaman Dokter
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: green500,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      "5 Tahun",
                                      style: regular8Green50,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Dokter Spesialis
                          Text(
                            detailDoctor.specialist?.name ?? '',
                            style: regular12Grey400,
                          ),
                          const SizedBox(height: 16),

                          // Nama Rumah Sakit dan Biaya
                          Row(
                            children: [
                              Image.asset(
                                Assets.assetsKlinik,
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                detailDoctor.clinic?.name ?? '',
                                style: regular12Grey900,
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                detailDoctor.price.toString(),
                                style: medium12Green500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),

          // Form Pilih Tanggal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Tanggal',
                style: semiBold14Grey900,
              ),
              const SizedBox(
                height: 16,
              ),

              //  Pilih Tanggal
              const PilihTanggalWidget(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Pilih Sesi',
                style: semiBold14Grey900,
              ),
              const SizedBox(
                height: 16,
              ),

              // Form Pilih Sesi
              const PilihSesiWidget(),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          // Button Component
          ButtonComponent(
            labelText: 'Lanjut ke Data Pemesanan',
            labelStyle: semiBold12Grey10,
            backgroundColor: green500,
            onPressed: () {
              // Bottom Sheet
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Consumer<JanjiTemuViewModel>(
                            builder: (context, janjiTemuViewModel, child) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 20),
                                    Text(
                                      'Pilih Profile Pasien',
                                      style: semiBold14Grey900,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 18),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: janjiTemuViewModel
                                          .profileList?.response?.length,
                                      itemBuilder: (context, int index) {
                                        final patientFamily = janjiTemuViewModel
                                            .profileList?.response?[index];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedPemesan = index;
                                            });
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(bottom: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  patientFamily?.name ?? '',
                                                  style: regular12Grey900,
                                                ),
                                                Radio(
                                                  activeColor: green500,
                                                  value: index,
                                                  groupValue: selectedPemesan,
                                                  onChanged: (value) {
                                                    setState(
                                                      () {
                                                        selectedPemesan =
                                                            value as int;
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 36,
                                    ),
                                    // Button Component
                                    ButtonComponent(
                                      labelText: 'Selanjutnya',
                                      labelStyle: semiBold12Grey10,
                                      backgroundColor: green500,
                                      onPressed: () {
                                        janjiTemuViewModel.postConsultasion(
                                          dataProfile: janjiTemuViewModel
                                              .profileList
                                              ?.response?[selectedPemesan],
                                          context: context,
                                          patientId: janjiTemuViewModel
                                                  .profileList
                                                  ?.response?[selectedPemesan]
                                                  .id ??
                                              '',
                                          doctorId: detailDoctor.id ?? '',
                                          date:
                                              Provider.of<PilihTanggalViewModel>(
                                                      context,
                                                      listen: false)
                                                  .dueDate,
                                          session:
                                              Provider.of<PilihSesiViewModel>(
                                                      context,
                                                      listen: false)
                                                  .selectedSession,
                                        );
                                        print(janjiTemuViewModel.profileList
                                            ?.response?[selectedPemesan].id);
                                        print(detailDoctor.id);
                                        print(Provider.of<PilihTanggalViewModel>(
                                                context,
                                                listen: false)
                                            .dueDate);
                                        print(Provider.of<PilihSesiViewModel>(
                                                context,
                                                listen: false)
                                            .selectedSession);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
