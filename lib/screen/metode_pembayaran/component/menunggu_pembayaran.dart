import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reprohealth_app/theme/theme.dart';

class MenungguPembayaran extends StatelessWidget {
  final String hours;
  final String minutes;
  final String seconds;
  const MenungguPembayaran({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menunggu Pembayaran',
            style: semiBold14Black,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            SizedBox(
              width: 179,
              child: Text(
                'Selesaikan pembayaran pada',
                style: regular12Grey400,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(hours.toString(), style: regular10Green50),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              ':',
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(minutes.toString(), style: regular10Green50),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              ':',
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                seconds.toString(),
                style: regular10Green50,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
