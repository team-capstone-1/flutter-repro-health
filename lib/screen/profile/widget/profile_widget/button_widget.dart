import 'package:flutter/material.dart';

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
