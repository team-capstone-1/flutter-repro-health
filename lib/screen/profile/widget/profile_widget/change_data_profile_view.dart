import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/text_field_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChangeDataProfile extends StatefulWidget {
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final TextEditingController? controller4;
  
  const ChangeDataProfile({
    super.key,
    this.controller1, this.controller2, this.controller3, this.controller4
    });

  @override
  State<ChangeDataProfile> createState() => _ChangeDataProfileState();
}

class _ChangeDataProfileState extends State<ChangeDataProfile> {
  String groupValue = "";
  
  get controller1 => null;
  get controller2 => null;
  get controller3 => null;
  get controller4 => null;

  @override
  Widget build(BuildContext context) {
    final datePickerProvider = Provider.of<DatePickerViewModel>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFFFAFAFA),
                ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                      controller: controller1, 
                      hintText: "Nama Lengkap",
                      label: "Nama Lengkap",
                      ),
                    const SizedBox(height: 16,),
                    TextFieldWidget(
                      controller: controller2, 
                      hintText: "Nomor Ponsel",
                      label: "Nomor Ponsel",
                      ),
                    const SizedBox(height: 16,),
                    GestureDetector(
                      onTap: () async {
                        final selectDate = await showDatePicker(
                          context: context,
                          initialDate: datePickerProvider.currentDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(datePickerProvider.currentDate.year + 5)
                          );
                          if (selectDate != null) {
                              datePickerProvider.dueDate = selectDate;
                          }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: grey500
                          ),
                          borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('dd-MM-yyyy').format(datePickerProvider.dueDate),
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_month,
                              color: green550,
                            )
                          ],
                        ),
                      ),
                    ),
                    // TextFieldWidget(
                    //   controller: controller, 
                    //   hintText: "Tanggal Lahir",
                    //   label: "Tanggal Lahir",
                    //   ),
                    const SizedBox(height: 16,),
                    const Text("Jenis Kelamin"),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          margin: const EdgeInsets.only(right: 8),
                          child: Radio(
                            fillColor: MaterialStateProperty.all(green550),
                            value: "Laki - laki", 
                            groupValue: groupValue, 
                            onChanged: (String? value) {
                              setState(() {
                                groupValue = value ?? "";
                              });
                            }
                          ),
                        ),
                        const Text("Laki - laki"),
                        const SizedBox(width: 16,),
                        Container(
                          width: 16,
                          margin: const EdgeInsets.only(right: 8),
                          child: Radio(
                            fillColor: MaterialStateProperty.all(green550),
                            value: "Perempuan", 
                            groupValue: groupValue, 
                            onChanged: (String? value) {
                              setState(() {
                                groupValue = value ?? "";
                              });
                            }
                          ),
                        ),
                        const Text("Perempuan"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    TextFieldWidget(
                      controller: controller3, 
                      hintText: "Berat Badan",
                      label: "Berat Badan",
                      ),
                    const SizedBox(height: 16,),
                    TextFieldWidget(
                      controller: controller4, 
                      hintText: "Tinggi Badan",
                      label: "Tinggi Badan",
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}