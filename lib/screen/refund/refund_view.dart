import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/component/button_component.dart';
import 'package:reprohealth_app/screen/refund/widget/refund_detail_widget.dart';
import 'package:reprohealth_app/models/riwayat_models/history_transaction_models.dart';
import 'package:reprohealth_app/screen/refund/refund_view_model/refund_view_model.dart';

class RefundView extends StatefulWidget {
  const RefundView({super.key});

  @override
  State<RefundView> createState() => _RefundViewState();
}

class _RefundViewState extends State<RefundView> {
  @override
  Widget build(BuildContext context) {
    final appointmentData =
        ModalRoute.of(context)?.settings.arguments as ResponseData?;

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
          Consumer<RefundViewModel>(
            builder: (context, controller, child) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                color: grey10,
                child: ButtonComponent(
                  labelText: Text(
                    controller.isLoading
                      ? 'Proses ...'
                      : 'Ajukan Pengembalian',
                      style: semiBold12Grey10,
                      textAlign: TextAlign.center,
                  ),
                  backgroundColor: negative,
                  elevation: 0,
                  onPressed: controller.isButtonEnabled()
                      ? () {
                          if (kDebugMode) {
                            print(controller.nameValue);
                            print(controller.selectedBank);
                            print(controller.accountValue);
                          }

                          // refund
                          if (controller.isLoading == false) {
                            controller.refund(
                              context: context,
                              appointmentData: appointmentData,
                            );
                          }
                        }
                      : null,
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: grey50,
    );
  }

  //^ FORM INPUT REKENING
  Consumer refundForm() {
    return Consumer<RefundViewModel>(
      builder: (context, controller, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: grey10,
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
                      errorText: controller.nameErrorText?.isNotEmpty == true
                          ? controller.nameErrorText
                          : null,
                      errorStyle: regular8Negative,
                    ),
                    onChanged: controller.nameOnchanged,
                  ),
                  const SizedBox(height: 14),

                  //^Pilih Bank
                  Text("Nama Bank", style: medium12Black),
                  const SizedBox(height: 4),
                  DropdownButtonFormField(
                    value: controller.selectedBank,
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
                    items: controller.bankLists.map((valueItems) {
                      return DropdownMenuItem(
                        value: valueItems,
                        child: Text(
                          valueItems,
                          style: regular14Grey400,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueOnChanged) {
                      controller.setSelectedBank = newValueOnChanged;
                    },
                    onSaved: (newValueOnSaved) {
                      controller.setSelectedBank = newValueOnSaved;
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
                      errorText: controller.accountErrorText?.isNotEmpty == true
                          ? controller.accountErrorText
                          : null,
                      errorStyle: regular8Negative,
                    ),
                    onChanged: controller.accountOnchanged,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
