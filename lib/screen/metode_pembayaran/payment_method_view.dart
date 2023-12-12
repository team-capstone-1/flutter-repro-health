import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/component/text_form_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/appointment_models/appointment_models.dart';
import 'package:reprohealth_app/models/payment_method_models/payment_method_models.dart';
import 'package:reprohealth_app/screen/dokter/view_models/janji_temu_view_model.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/component/menunggu_pembayaran.dart';
import 'package:reprohealth_app/screen/metode_pembayaran/component/rincian_pembayaran.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController rekeningCont = TextEditingController();
  String selectedBank = '';
  final CreatePaymentService _paymentService = CreatePaymentService();
  late JanjiTemuViewModel viewModel;
  late Duration _countdownTimer;
  late DateTime _endTime;

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

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _showImagePicker() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Foto',
                  style: semiBold16Black,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.camera);
                    _handlePickedImage(pickedFile);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Ambil Foto',
                      style: regular14Grey900,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.gallery);
                    _handlePickedImage(pickedFile);
                  },
                  child: Text(
                    'Pilih dari Galeri',
                    style: regular14Grey900,
                  ),
                )
              ],
            ),
          );
        });
  }

  _handlePickedImage(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
  }

  bool _isButtonEnabled() {
    return _validateName(nameController.text) == null &&
        _validateRekening(rekeningCont.text) == null &&
        selectedBank.isNotEmpty;
  }

  _onButtonPressed() async {
    String paymentId =
        viewModel.appointmentList?.response?.first.payment?.first.id ?? '0';
    try {
      PaymentMethod paymentMethod = PaymentMethod(
        method: 'manual_transfer',
        name: nameController.text,
        accountNumber: rekeningCont.text,
        image: _pickedImage != null ? _pickedImage!.path : '',
      );
      Map<String, dynamic> createPayment =
          await _paymentService.createPayment(paymentId, paymentMethod);
      print('Payment successful');
      Navigator.pushNamed(context, RoutesNavigation.confirmSplashView);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    _endTime = DateTime.now().add(Duration(hours: 24));
    _updateCountdown();

    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateCountdown();
    });
  }

  void _updateCountdown() {
    setState(() {
      _countdownTimer = _endTime.difference(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Column(
              children: [
                MenungguPembayaran(
                  hours: _countdownTimer.inHours.toString().padLeft(2, '0'),
                  minutes: (_countdownTimer.inMinutes % 60)
                      .toString()
                      .padLeft(2, '0'),
                  seconds: (_countdownTimer.inSeconds % 60)
                      .toString()
                      .padLeft(2, '0'),
                ),
                const SizedBox(
                  height: 4,
                ),
                RincianPembayaran(
                  method: viewModel.appointmentList?.response?.first.payment
                          ?.first.method ??
                      'Unknown', //replace with the method
                  total: viewModel.appointmentList?.response?.first.total ??
                      0, //replace with total
                  adminPrice:
                      viewModel.appointmentList?.response?.first.adminPrice ??
                          0,
                  price: viewModel.appointmentList?.response?.first.price ?? 0,
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
                        controller: nameController,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        controller: rekeningCont,
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
                          await _showImagePicker();
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
                              if (_pickedImage != null)
                                ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken,
                                  ),
                                  child: Image.file(
                                    File(_pickedImage!.path),
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
                backgroundColor: _isButtonEnabled() ? green500 : grey400,
                onPressed: _isButtonEnabled() ? _onButtonPressed : null,
                elevation: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
