import 'package:flutter/material.dart';
import 'package:reprohealth_app/models/dokter_models.dart';
import 'package:reprohealth_app/theme/theme.dart';

class ListDokterWidget extends StatelessWidget {
  final DokterModels interMedika;

  const ListDokterWidget({Key? key, required this.interMedika})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0,
      height: 198.0,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Card(
              color: grey10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image Dokter
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Flexible(
                        child: SizedBox(
                          height: 66,
                          width: 66,
                          child: Image.asset(
                            interMedika.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Flexible(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Nama Dokter
                                Flexible(
                                  child: Text(
                                    interMedika.nama,
                                    style: medium14Grey500,
                                  ),
                                ),

                                // Tahun Pengalaman Dokter
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: primarygreen500),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 3,
                                      ),
                                      child: Text(
                                        interMedika.tahun,
                                        style: regular8Green50,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),

                            // Dokter Spesialis
                            Text(
                              interMedika.spesialis,
                              style: regular12Grey400,
                            ),
                            const SizedBox(height: 16),

                            // Nama Rumah Sakit dan Biaya
                            Row(
                              children: [
                                Image.asset(
                                  interMedika.imageIcon,
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  interMedika.rumahSakit,
                                  style: regular12Grey900,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  interMedika.biaya,
                                  style: medium12PrimaryGreen500,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
