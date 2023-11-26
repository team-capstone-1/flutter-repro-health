import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/forum_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class PertanyaanSayaWidget extends StatelessWidget {
  final ForumModel forum;

  const PertanyaanSayaWidget({Key? key, required this.forum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0,
      height: 220.0,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 16,
                bottom: 8,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(forum.jawab, style: regular10Green500),
                    const SizedBox(width: 8),
                    Image.asset(
                      forum.iconTitik,
                      width: 2,
                      height: 2,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      forum.unggah,
                      style: regular10Grey200,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 8,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  forum.title,
                  style: medium14Grey900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 12,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(forum.subtitle,
                    textAlign: TextAlign.justify, style: regular10Grey400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(
                    forum.image,
                    width: 53.82,
                    height: 32,
                  ),
                  const SizedBox(width: 168),
                  Text(
                    forum.lihat,
                    style: regular12Grey400,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    forum.icon,
                    width: 6.59,
                    height: 11.17,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
