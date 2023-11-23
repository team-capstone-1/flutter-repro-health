import 'package:flutter/material.dart';

class MapsModels {
  final IconData icon;
  final String namaStasiun;
  final String jalan;

  MapsModels({
    required this.icon,
    required this.namaStasiun,
    required this.jalan,
  });
}

List<MapsModels> mapsData = [
  MapsModels(
    icon: Icons.location_on_outlined,
    namaStasiun: 'Stasiun Tanah Abang',
    jalan:
        'Jalan Jati Baru Raya, Jl. Cideng Timur, Kecamatan Tanah Abang, 10250',
  ),
  MapsModels(
    icon: Icons.location_on_outlined,
    namaStasiun: 'Galeri Nasional Indonesia',
    jalan:
        'Jl. Medan Merdeka Tim. No.14, RT.6/RW.1, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110',
  ),
];
