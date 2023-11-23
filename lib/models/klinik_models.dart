import 'package:flutter/material.dart';

class KlinikModels {
  final String image;
  final String namaRumahSakit;
  final String jalan;
  final IconData icon;
  final String jarak;

  KlinikModels({
    required this.image,
    required this.namaRumahSakit,
    required this.icon,
    required this.jalan,
    required this.jarak,
  });
}

List<KlinikModels> klinikModelsData = [
  KlinikModels(
    image: 'assets/foto_klinik.png',
    namaRumahSakit: 'Griya Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. Garuda No 47, Kemayoran, Jakarta Pusat',
    jarak: '1 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik2.png',
    namaRumahSakit: 'Inter Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. K.S. Tubun No.21, Petamburan, Jakarta Pusat',
    jarak: '2 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik3.png',
    namaRumahSakit: 'Mischa Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. Jenderal Sudirman No.Kav. 3-4, Tanah Abang, Jakarta Pusat',
    jarak: '3 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik4.png',
    namaRumahSakit: 'Medialys',
    icon: Icons.location_on_outlined,
    jalan: 'Jl Letjen Suprapto No 504D, Galur, Jakarta Pusat',
    jarak: '4 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik5.png',
    namaRumahSakit: 'Sejahtera Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. Percetakan Negara No. 17 A, Rawasari, Jakarta Pusat',
    jarak: '4,5 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik6.png',
    namaRumahSakit: 'Modern Care',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. Letjend Soeprapto kav 13, Cempaka Putih, Jakarta Pusat',
    jarak: '5,5 km dari posisi anda',
  ),
];

List<KlinikModels> klinikDasboardModelsData = [
  KlinikModels(
    image: 'assets/foto_klinik.png',
    namaRumahSakit: 'Griya Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. Garuda No 47, Kemayoran, Jakarta Pusat',
    jarak: '1 km dari posisi anda',
  ),
  KlinikModels(
    image: 'assets/foto_klinik2.png',
    namaRumahSakit: 'Inter Medika',
    icon: Icons.location_on_outlined,
    jalan: 'Jl. K.S. Tubun No.21, Petamburan, Jakarta Pusat',
    jarak: '2 km dari posisi anda',
  ),
];
