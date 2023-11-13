import 'package:capstone_flutter_test/models/forum_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumCard extends StatelessWidget {
  final ForumModel forum;

  const ForumCard({Key? key, required this.forum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0,
      height: 240.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      forum.jawab,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff14C6A4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      forum.iconTitik,
                      width: 2,
                      height: 2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      forum.unggah,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff989898),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  forum.title,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0D0D0D)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  forum.subtitle,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                    forum.image,
                    width: 53.82,
                    height: 32,
                  ),
                  const SizedBox(width: 168),
                  Text(
                    forum.lihat,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff4B4B4B),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    forum.icon,
                    width: 6.59,
                    height: 11.17,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
