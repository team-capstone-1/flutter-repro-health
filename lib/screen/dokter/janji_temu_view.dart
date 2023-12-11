import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/component/card_doctor_component.dart';
import 'package:reprohealth_app/theme/theme.dart';

class JanjiTemuView extends StatelessWidget {
  const JanjiTemuView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentDoctor?;
    final ArgumentDoctor? detailArgument = args;

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
                imageUrl: detailArgument?.dataDoctor?.profileImage ?? '',
                // dataAppointment?.consultation?.doctor?.profileImage ?? '',
                // doctorName: dataAppointment?.consultation?.doctor?.name ?? '',
                doctorName: detailArgument?.dataDoctor?.name ?? '',
                doctorSpecialist:
                    detailArgument?.dataDoctor?.specialist?.name ?? '',
                clinicsName: detailArgument?.dataDoctor?.clinic?.name ?? '',
                doctorPrice: detailArgument?.dataDoctor?.price ?? 0,
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
                        DateFormat('EEEE, d MMMM yyyy').format(
                          janjiTemuViewModel.currentDate,
                        ),
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
                            janjiTemuViewModel.selectedSession,
                            style: semiBold12Grey500,
                          ),
                          Text(
                            ' (${() {
                              if (janjiTemuViewModel.selectedSession ==
                                  'pagi') {
                                return ("08.00 - 11.00");
                              } else if (janjiTemuViewModel.selectedSession ==
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
                          detailArgument?.dataDoctor?.clinic?.location ?? '',
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
                        detailArgument?.dataProfile?.name ?? '-',
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
                        detailArgument?.dataProfile?.gender ?? '',
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
                        detailArgument?.dataProfile?.telephoneNumber ?? '-',
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
                labelText: Text(
                  "Pilih Metode Pembayaran",
                  style: semiBold12Grey10,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: green500,
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Consumer<JanjiTemuViewModel>(
                        builder: (context, janjiTemuViewModel, child) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pilih Metode Pembayaran",
                                      style: medium14Black,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Divider(color: grey50),
                                const SizedBox(height: 10),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: janjiTemuViewModel
                                      .listPaymentMethod.length,
                                  itemBuilder: (context, index) {
                                    var paymentListData = janjiTemuViewModel
                                        .listPaymentMethod[index];
                                    return GestureDetector(
                                      onTap: () {
                                        janjiTemuViewModel.setSelectedPayment =
                                            paymentListData;
                                      },
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: janjiTemuViewModel
                                                              .selectedPayment ==
                                                          paymentListData
                                                      ? green500
                                                      : const Color.fromARGB(
                                                          255, 82, 82, 82),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: grey50,
                                                    child:
                                                        const Icon(Icons.abc),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    paymentListData,
                                                    style: medium12Grey500,
                                                  ),
                                                  const Spacer(),
                                                  Radio(
                                                    activeColor: green500,
                                                    value: paymentListData,
                                                    groupValue:
                                                        janjiTemuViewModel
                                                            .selectedPayment,
                                                    onChanged: (value) {
                                                      janjiTemuViewModel
                                                              .setSelectedPayment =
                                                          value!;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                ButtonComponent(
                                  labelText: Text(
                                    "Bayar",
                                    style: medium14Grey10,
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: green500,
                                  onPressed: () {
                                    janjiTemuViewModel.postConsultasion(
                                      patientId:
                                          detailArgument?.dataProfile?.id ?? '',
                                      doctorId:
                                          detailArgument?.dataDoctor?.id ?? '',
                                      date: janjiTemuViewModel.currentDate,
                                      session:
                                          janjiTemuViewModel.selectedSession,
                                      context: context,
                                    );
                                  },
                                ),
                              ],
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
          );
        },
      ),
    );
  }
}
