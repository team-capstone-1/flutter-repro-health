import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JanjiTemuView extends StatelessWidget {
  const JanjiTemuView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArgumentDoctor?;
    final ArgumentDoctor? detailProfile = args;

    Provider.of<JanjiTemuViewModel>(context)
        .getTransactions(patientId: detailProfile?.dataProfile.id ?? '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey10,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.5),
          child: Text(
            'Janji Temu Saya',
            style: semiBold16Grey500,
          ),
        ),
        iconTheme: IconThemeData(color: primary4),
      ),
      body: Consumer<JanjiTemuViewModel>(
        builder: (context, janjiTemuViewModel, child) {
          ResponseDataAppointment? dataAppointment;
          for (var response in janjiTemuViewModel.appointmentList?.response ?? []) {
            if (response.consultationId == detailProfile?.id) {
              dataAppointment = response;
            }
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              const SizedBox(
                height: 24,
              ),
              // Profil Dokter
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
                        child: Flexible(
                          child: SizedBox(
                            height: 66,
                            width: 66,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: dataAppointment
                                      ?.consultation?.doctor?.profileImage ??
                                  '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Center(
                                child: Icon(
                                  Icons.error,
                                  size: 50,
                                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Nama Dokter
                                  Flexible(
                                    child: Text(
                                      dataAppointment
                                              ?.consultation?.doctor?.name ??
                                          '',
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
                                dataAppointment
                                        ?.consultation?.doctor?.specialist ??
                                    '',
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
                                    dataAppointment
                                            ?.consultation?.clinic?.name ??
                                        '',
                                    style: regular12Grey900,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    dataAppointment?.consultation?.doctor?.price
                                            .toString() ??
                                        '',
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
              const Padding(
                padding: EdgeInsets.only(
                  top: 12,
                  bottom: 24,
                ),
                child: Divider(
                  thickness: 1,
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jadwal Janji Temu',
                  style: medium14Grey900,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal',
                        style: regular12Grey400,
                      ),
                      Text(
                        dataAppointment?.consultation?.date == null ? '-' : DateFormat('EEEE, d MMMM yyyy')
                            .format(dataAppointment!.consultation!.date!),
                        style: semiBold12Grey500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sesi',
                        style: regular12Grey400,
                      ),
                      Text('${dataAppointment?.consultation?.session} (${() {
                        if (dataAppointment?.consultation?.session == 'pagi') {
                          return ("08.00 - 11.00");
                        } else if (dataAppointment?.consultation?.session ==
                            'siang') {
                          return ("13.00 - 15.30");
                        } else {
                          return ("18.00 - 21.30");
                        }
                      }()})'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Lokasi',
                          style: regular12Grey400,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          dataAppointment?.consultation?.clinic?.location ?? '',
                          style: semiBold12Grey500,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Data Pemesanan',
                  style: medium14Grey900,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama',
                        style: regular12Grey400,
                      ),
                      Text(
                        detailProfile?.dataProfile.name ?? '-',
                        style: semiBold12Grey500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: regular12Grey400,
                      ),
                      Text(
                        detailProfile?.dataProfile.gender ?? '',
                        style: semiBold12Grey500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nomor Ponsel',
                        style: regular12Grey400,
                      ),
                      Text(
                        detailProfile?.dataProfile.telephoneNumber ?? '-',
                        style: semiBold12Grey500,
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 100),
                child: Divider(
                  thickness: 1,
                ),
              ),
              ButtonComponent(
                labelText: 'Pilih Metode Pembayaran',
                labelStyle: semiBold12Grey10,
                backgroundColor: green500,
                onPressed: () {},
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          );
        },
      ),
    );
  }
}
