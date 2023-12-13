import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/component/menunggu_pembayaran.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/component/rincian_pembayaran.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/view_model/payment_view_model.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PaymentMethodView extends StatefulWidget {
  const PaymentMethodView({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethodView> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethodView> {
  Duration? _countdownTimer;
  Duration? get countdownTimer => _countdownTimer;

  DateTime? _endTime;
  DateTime? get endTime => _endTime;

  void _updateCountdown() {
    _countdownTimer = _endTime?.difference(DateTime.now());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _endTime = DateTime.now().add(const Duration(hours: 24));
    _updateCountdown();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCountdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as IdArgument?;
    final IdArgument? transaction= args;

    Provider.of<JanjiTemuViewModel>(context)
        .getTransactions(patientId: transaction?.idProfile ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konfirmasi Pembayaran',
          style: semiBold16Black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer<PaymentViewModel>(
          builder: (context, paymentViewModel, child) {
            ResponseDataAppointment? dataPayment;
            for (var element
                in Provider.of<JanjiTemuViewModel>(context, listen: false)
                    .appointmentList!
                    .response!) {
              if (element.id == transaction?.idTransaction) {
                dataPayment = element;
              }
            }
            return Column(
              children: [
                Column(
                  children: [
                    MenungguPembayaran(
                      hours:
                          countdownTimer?.inHours.toString().padLeft(2, '0') ??
                              '-',
                      minutes: (countdownTimer!.inMinutes % 60)
                          .toString()
                          .padLeft(2, '0'),
                      seconds: (countdownTimer!.inSeconds % 60)
                          .toString()
                          .padLeft(2, '0'),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RincianPembayaran(
                      method: dataPayment?.consultation?.paymentMethod ==
                              "manual_transfer"
                          ? "Transfer Manual"
                          : '',
                      total:
                          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                              .format(dataPayment?.total),
                      adminPrice:
                          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                              .format(dataPayment?.adminPrice),
                      price:
                          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                              .format(dataPayment?.price),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Konfigurasi Pembayaran Manual',
                              style: semiBold14Black,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Nama',
                            style: medium12Black,
                          ),
                          TextFormComponent(
                            controller: paymentViewModel.nameController,
                            hintText: 'Masukkan nama',
                            hinstStyle: regular12Grey200,
                            validator: paymentViewModel.validateName,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Nama bank',
                            style: medium12Black,
                          ),
                          GestureDetector(
                            onTap: () {
                              paymentViewModel.isExpand();
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: grey400),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    paymentViewModel.selectedBank.isNotEmpty
                                        ? paymentViewModel.selectedBank
                                        : 'Pilih nama bank',
                                    style: regular12Grey200,
                                  ),
                                  Visibility(
                                    visible: paymentViewModel.isExpanded,
                                    replacement: const Icon(Icons.expand_more),
                                    child: const Icon(Icons.expand_less),
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (paymentViewModel.isExpanded)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 181,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: grey400),
                                  ),
                                  child: ListView.builder(
                                    itemCount: paymentViewModel.banks.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          paymentViewModel.selectBank(index);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Text(
                                            paymentViewModel.banks[index],
                                            style: regular14Grey900,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Nomor Rekening',
                            style: medium12Black,
                          ),
                          TextFormComponent(
                            controller: paymentViewModel.rekController,
                            hintText: 'Masukkan nomor rekening',
                            hinstStyle: regular12Grey200,
                            validator: paymentViewModel.validateRekening,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Unggah Bukti',
                            style: medium12Black,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await paymentViewModel.showImagePicker(
                                  context: context);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: grey400),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  if (paymentViewModel.pickedImage != null)
                                    ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.darken,
                                      ),
                                      child: Image.file(
                                        File(
                                          paymentViewModel.pickedImage!.path,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: Text('Ganti Foto',
                                          style: semiBold12Grey10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: ButtonComponent(
                    labelText: Text(
                      "Kirim",
                      style: semiBold12Grey10,
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: green500,
                    onPressed: () {
                      paymentViewModel.createPayment(
                        context: context,
                        idTransaction: transaction?.idTransaction ?? '',
                      );
                    },
                    elevation: 0,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
