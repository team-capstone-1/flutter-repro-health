import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/component/card_doctor_component.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JanjiTemuView extends StatelessWidget {
  const JanjiTemuView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentDoctor?;
    final ArgumentDoctor? detailProfile = args;

    Provider.of<JanjiTemuViewModel>(context)
        .getTransactions(patientId: detailProfile?.dataProfile.id ?? '');
    return Scaffold(
      backgroundColor: grey10,
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
          for (var response
              in janjiTemuViewModel.appointmentList?.response ?? []) {
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

              // PROFIL DOCTOR
              CardDoctorComponent(
                imageUrl:
                    dataAppointment?.consultation?.doctor?.profileImage ?? '',
                doctorName: dataAppointment?.consultation?.doctor?.name ?? '',
                doctorSpecialist:
                    dataAppointment?.consultation?.doctor?.specialist ?? '',
                clinicsName: dataAppointment?.consultation?.clinic?.name ?? '',
                doctorPrice: dataAppointment?.consultation?.doctor?.price ?? 0,
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
                        dataAppointment?.consultation?.date == null
                            ? '-'
                            : DateFormat('EEEE, d MMMM yyyy')
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
                      Row(
                        children: [
                          Text(
                            dataAppointment?.consultation?.session ?? '',
                            style: semiBold12Grey500,
                          ),
                          Text(
                            ' (${() {
                              if (dataAppointment?.consultation?.session ==
                                  'pagi') {
                                return ("08.00 - 11.00");
                              } else if (dataAppointment
                                      ?.consultation?.session ==
                                  'siang') {
                                return ("13.00 - 15.30");
                              } else {
                                return ("18.00 - 21.30");
                              }
                            }()})',
                            style: semiBold12Green500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          'Lokasi',
                          style: regular12Grey400,
                        ),
                      ),
                      Flexible(
                        flex: 4,
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
