import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';
import 'package:reprohealth_app/screen/profile/view_model/post_family_profile_view_model.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/text_field_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChangeDataProfile extends StatelessWidget {
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final TextEditingController? controller4;
  final TextEditingController? dateController;

  ChangeDataProfile({
    Key? key,
    this.controller1,
    this.controller2,
    this.controller3,
    this.controller4, 
    this.dateController, 
  }) : super(key: key);

  late final ValueNotifier<String> groupValue = ValueNotifier("");

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
                          lastDate: DateTime(datePickerProvider.currentDate.year + 10)
                          );
                          if (selectDate != null) {
                            datePickerProvider.dueDate = selectDate;
                            dateController?.text = DateFormat('dd/MM/yyyy').format(selectDate);
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
                              dateController?.text ?? "",
                              style: regular12Grey500,
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_month,
                              color: green500,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text("Jenis Kelamin",
                    style: regular12Grey500,
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder<String>(
                          valueListenable: groupValue,
                          builder: (context, value, _) {
                            return Container(
                              width: 16,
                              margin: const EdgeInsets.only(right: 8),
                              child: Radio(
                                fillColor: MaterialStateProperty.all(green500),
                                value: "male",
                                groupValue: value,
                                onChanged: (String? value) {
                                  groupValue.value = value ?? "";
                                  Provider.of<PostFamilyProfileViewModel>(context, listen: false).gender = value ?? "";
                                },
                              ),
                            );
                          },
                        ),
                        Text("Laki - laki",
                        style: regular12Grey500,
                        ),
                        const SizedBox(width: 16),
                        ValueListenableBuilder<String>(
                          valueListenable: groupValue,
                          builder: (context, value, _) {
                            return Container(
                              width: 16,
                              margin: const EdgeInsets.only(right: 8),
                              child: Radio(
                                fillColor: MaterialStateProperty.all(green500),
                                value: "female",
                                groupValue: value,
                                onChanged: (String? value) {
                                  groupValue.value = value ?? "";
                                  Provider.of<PostFamilyProfileViewModel>(context, listen: false).gender = value ?? "";
                                },
                              ),
                            );
                          },
                        ),
                        Text("Perempuan",
                        style: regular12Grey500,
                        ),
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
