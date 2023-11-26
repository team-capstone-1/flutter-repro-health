import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:reprohealth_app/screen/profile/widget/profile_widget/bottom_sheet_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color color;


  const ButtonWidget({
    super.key, 
    required this.title, 
    required this.onPressed,
    required this.color
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
       style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        )
      ),
      
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFEFF2F6),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          ),
      )
    );
  }
}

class DotBorder extends StatelessWidget {
  const DotBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [6],
        padding: const EdgeInsets.symmetric(vertical: 56),
        child: GestureDetector(
          onTap: () {
             BottomSheetWidget.bottomSheet(context);
          },
          child: Center(
            child: Container(
              height: 40,
              width: 100,
              decoration: ShapeDecoration(
                color: const Color(0xFF14C6A4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined,
                    color: Colors.white,
                    ),
                    SizedBox(width: 8,),
                    Text("Unggah",
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}