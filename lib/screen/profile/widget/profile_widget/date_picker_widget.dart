import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reprohealth_app/screen/profile/view_model/date_picker_view_model.dart';

class DatePickerWidget extends StatelessWidget {

   const DatePickerWidget(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final datePickerProvider = Provider.of<DatePickerViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
            onPressed:() async{
              final selectDate = await showDatePicker(
              context: context,
              initialDate: datePickerProvider.currentDate,
              firstDate: DateTime(1990),
              lastDate: DateTime(datePickerProvider.currentDate.year + 5)
              );
              if (selectDate != null) {
                  datePickerProvider.dueDate = selectDate;
                }
            },
            child: const Text('Select'),
            )
          ],
          ),
        Text(
          DateFormat('dd-MM-yyyy').format(datePickerProvider.dueDate),
        ),
      ],
    );
  }
}