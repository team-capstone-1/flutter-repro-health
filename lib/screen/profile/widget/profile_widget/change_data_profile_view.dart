import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/text_field_widget.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ChangeDataProfile extends StatefulWidget {
  final TextEditingController? controller;
  
  const ChangeDataProfile({
    super.key, 
    required this.controller
    });

  @override
  State<ChangeDataProfile> createState() => _ChangeDataProfileState();
}

class _ChangeDataProfileState extends State<ChangeDataProfile> {
  String groupValue = "";
  
  get controller => null;

  @override
  Widget build(BuildContext context) {
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
                      controller: controller, 
                      hintText: "Nama Lengkap",
                      label: "Nama Lengkap",
                      ),
                    const SizedBox(height: 16,),
                    TextFieldWidget(
                      controller: controller, 
                      hintText: "Nomor Ponsel",
                      label: "Nomor Ponsel",
                      ),
                    const SizedBox(height: 16,),
                    TextFieldWidget(
                      controller: controller, 
                      hintText: "Tanggal Lahir",
                      label: "Tanggal Lahir",
                      ),
                    const SizedBox(height: 16,),
                    const Text("Jenis Kelamin"),
                    Row(
                      children: [
                        Container(
                          width: 16,
                          margin: const EdgeInsets.only(right: 8),
                          child: Radio(
                            fillColor: MaterialStateProperty.all(green500),
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
                            fillColor: MaterialStateProperty.all(green500),
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
                      controller: controller, 
                      hintText: "Berat Badan",
                      label: "Berat Badan",
                      ),
                    const SizedBox(height: 16,),
                    TextFieldWidget(
                      controller: controller, 
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