import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reprohealth_app/constant/assets_constants.dart';
import 'package:reprohealth_app/theme/theme.dart';

class CardDoctorComponent extends StatelessWidget {
  final String imageUrl;
  final String doctorName;
  final String doctorSpecialist;
  final String clinicsName;
  final int doctorPrice;
  const CardDoctorComponent({
    super.key,
    required this.imageUrl,
    required this.doctorName,
    required this.doctorSpecialist,
    required this.clinicsName,
    required this.doctorPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 66,
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ROW NAMA DAN TAHUN
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Dokter
                        Flexible(
                          child: Text(
                            doctorName,
                            style: medium14Grey500,
                          ),
                        ),

                        // Tahun Pengalaman Dokter
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: green500,
                          ),
                          child: Text(
                            "5 Tahun",
                            style: regular10Green50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctorSpecialist,
                      style: regular12Grey400,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(
                          Assets.assetsKlinik,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          clinicsName,
                          style: regular12Grey900,
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ').format(doctorPrice),
                          style: medium12Green500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
