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
  bool isExpanded = false;
  String selectedBank = '';
  Duration? _countdownTimer;
  DateTime? _endTime;

  final List<String> banks = [
    'BCA',
    'BNI',
    'Mandiri',
    'CIMB Niaga',
    'Danamon',
    'Maybank',
    'Mestika'
  ];

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan Nama';
    }
    return null;
  }

  String? _validateRekening(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor rekening tidak boleh kosong';
    } else if (value.length < 8) {
      return 'Nomor rekening minimal 8 karakter';
    }
    return null;
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

  void _updateCountdown() {
    setState(() {
      _countdownTimer = _endTime?.difference(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    String? patientId = Provider.of<JanjiTemuViewModel>(context).profileList?.response?.first.id.toString();
    Provider.of<JanjiTemuViewModel>(context).getTransactions(patientId: patientId ?? '');
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    final String? idTransaction = args;

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
            for (var element in Provider.of<JanjiTemuViewModel>(context, listen: false).appointmentList!.response!) {
              if (element.id == idTransaction) {
                dataPayment = element;
              }
            }
            return Column(
              children: [
                Column(
                  children: [
                    MenungguPembayaran(
                      hours:
                          _countdownTimer?.inHours.toString().padLeft(2, '0') ??
                              '-',
                      minutes: (_countdownTimer!.inMinutes % 60)
                          .toString()
                          .padLeft(2, '0'),
                      seconds: (_countdownTimer!.inSeconds % 60)
                          .toString()
                          .padLeft(2, '0'),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RincianPembayaran(
                      method: dataPayment?.consultation?.paymentMethod ?? '',
                      // total: dataPayment?.total ?? 0,
                      total: NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(dataPayment?.total),
                      adminPrice: NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(dataPayment?.adminPrice),
                      price: NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(dataPayment?.price),
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
                            validator: _validateName,
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
                              setState(() {
                                isExpanded = !isExpanded;
                              });
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
                                    selectedBank.isNotEmpty
                                        ? selectedBank
                                        : 'Pilih nama bank',
                                    style: regular12Grey200,
                                  ),
                                  Visibility(
                                    visible: isExpanded,
                                    replacement: const Icon(Icons.expand_more),
                                    child: const Icon(Icons.expand_less),
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (isExpanded)
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
                                    itemCount: banks.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedBank = banks[index];
                                            isExpanded = false;
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Text(
                                            banks[index],
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
                            validator: _validateRekening,
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
                                            paymentViewModel.pickedImage!.path),
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
                        idTransaction: idTransaction ?? '',
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
