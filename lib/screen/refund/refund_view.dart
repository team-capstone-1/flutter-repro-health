import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/constant/routes_navigation.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';
import 'package:reprohealth_app/screen/refund/widget/refund_detail_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class RefundView extends StatefulWidget {
  const RefundView({super.key});

  @override
  State<RefundView> createState() => _RefundViewState();
}

class _RefundViewState extends State<RefundView> {
  final List<String> bankLists = [
    "BCA",
    "Mandiri",
    "BRI",
    "BNI",
    "Bank Syariah",
    "Bank Mega",
    "Danamon",
    "Maybank",
    "Mestika",
  ];

  String? selectedBank;
  String nameValue = '';
  String accountValue = '';
  String nameErrorText = '';
  String accountErrorText = '';

  bool isButtonEnabled() {
    return nameValue.isNotEmpty &&
        accountValue.isNotEmpty &&
        nameErrorText.isEmpty &&
        accountErrorText.isEmpty &&
        selectedBank != null;
  }

  void nameOnchanged(String value) {
    setState(() {
      nameValue = value;
      if (nameValue.isEmpty) {
        nameErrorText = 'Nama tidak boleh kosong';
      } else if (RegExp(r'[0-9]').hasMatch(nameValue)) {
        nameErrorText = 'Nama tidak boleh mengandung angka';
      } else if (!RegExp(r'^[A-Z]').hasMatch(nameValue.substring(0, 1))) {
        nameErrorText = 'Nama harus dimulai dengan huruf kapital';
      } else if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(nameValue)) {
        nameErrorText = 'Nama tidak boleh mengandung karakter khusus';
      } else {
        nameErrorText = '';
      }
    });
  }

  void accountOnchanged(String value) {
    setState(() {
      accountValue = value;
      if (accountValue.isEmpty) {
        accountErrorText = 'Rekening tidak boleh kosong';
      } else if (!RegExp(r'^[0-9]*$').hasMatch(accountValue)) {
        accountErrorText =
            'Rekening tidak boleh mengandung huruf atau karakter khusus';
      } else {
        accountErrorText = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as Transaction;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengembalian Dana",
          style: semiBold16Grey700,
        ),
        backgroundColor: grey10,
        elevation: 0,
        iconTheme: IconThemeData(color: grey700),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView(
                children: [
                  const SizedBox(height: 4),

                  //^INFORMASI RINCIAN PENGEMBALIAN DANA
                  RefundDetailWidget(appointmentData: appointmentData),
                  const SizedBox(height: 4),

                  //^FORM INPUT REKENING
                  refundForm(),
                ],
              ),
            ),
          ),

          //^ ACTION BUTTON
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            color: grey10,
            child: ButtonComponent(
              labelText: 'Ajukan Pengembalian',
              labelStyle: semiBold12Grey10,
              backgroundColor: negative,
              elevation: 0,
              onPressed: isButtonEnabled()
                  ? () {
                      if (kDebugMode) {
                        print(nameValue);
                        print(selectedBank);
                        print(accountValue);
                      }
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNavigation.refundDetailsView,
                        (route) => route.isFirst,
                        arguments: appointmentData,
                      );
                    }
                  : null,
            ),
          ),
        ],
      ),
      backgroundColor: grey50,
    );
  }

  //^ FORM INPUT REKENING
  Container refundForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //^Masukan Nomer Pengembalian
          Text(
            "Masukan Nomor Pengembalian",
            style: semiBold14Black,
          ),
          const SizedBox(height: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //^Input Nama
              Text("Nama", style: medium12Black),
              const SizedBox(height: 4),
              TextField(
                autocorrect: false,
                style: regular14Grey400,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: green500,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: negative,
                    ),
                  ),
                  hintText: 'Masukan Nama',
                  hintStyle: regular12Grey200,
                  errorText: nameErrorText.isNotEmpty ? nameErrorText : null,
                  errorStyle: regular8Negative,
                ),
                onChanged: nameOnchanged,
              ),
              const SizedBox(height: 14),

              //^Pilih Bank
              Text("Nama Bank", style: medium12Black),
              const SizedBox(height: 4),
              DropdownButtonFormField(
                value: selectedBank,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: green500,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: negative,
                    ),
                  ),
                  hintText: 'Pilih Bank Anda',
                  hintStyle: regular12Grey200,
                  isDense: true,
                ),
                items: bankLists.map((valueItems) {
                  return DropdownMenuItem(
                    value: valueItems,
                    child: Text(
                      valueItems,
                      style: regular14Grey400,
                    ),
                  );
                }).toList(),
                onChanged: (newValueOnChanged) {
                  setState(() {
                    selectedBank = newValueOnChanged;
                  });
                },
                onSaved: (newValueOnSaved) {
                  if (newValueOnSaved != null) {
                    setState(() {
                      selectedBank = newValueOnSaved;
                    });
                  }
                },
              ),
              const SizedBox(height: 14),

              //^Masukan Nomer Rekening
              Text("Rekening", style: medium12Black),
              const SizedBox(height: 4),
              TextField(
                autocorrect: false,
                style: regular14Grey400,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: green500,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: negative,
                    ),
                  ),
                  hintText: 'Masukan Nomor Rekening',
                  hintStyle: regular12Grey200,
                  errorText:
                      accountErrorText.isNotEmpty ? accountErrorText : null,
                  errorStyle: regular8Negative,
                ),
                onChanged: accountOnchanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
