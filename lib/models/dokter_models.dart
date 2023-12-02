class DokterModelsLama {
  final String image;
  final String nama;
  final String spesialis;
  final String imageIcon;
  final String rumahSakit;
  final String tahun;
  final String biaya;

  DokterModelsLama({
    required this.image,
    required this.nama,
    required this.spesialis,
    required this.imageIcon,
    required this.rumahSakit,
    required this.tahun,
    required this.biaya,
  });
}

List<DokterModelsLama> dokterKandunganData = [
  DokterModelsLama(
    image: 'assets/dr_nuke_spesialis.png',
    nama: 'Dr. Nuke Nugrahanti, SpOG',
    spesialis: 'Dokter Kandungan',
    imageIcon: 'assets/klinik.png',
    rumahSakit: 'Inter Medika',
    tahun: '5 tahun',
    biaya: 'Rp. 70.000',
  ),
  DokterModelsLama(
    image: 'assets/dr_nugroho_spesialis.png',
    nama: 'Dr. Nugroho Setiawa, Sp.And.',
    spesialis: 'Dokter Kandungan',
    imageIcon: 'assets/klinik.png',
    rumahSakit: 'Griya Medika',
    tahun: '8 tahun',
    biaya: 'Rp. 80.000',
  ),
  DokterModelsLama(
    image: 'assets/dr_caroline_spesialis.png',
    nama: 'Dr. Caroline Tirtajasa, Sp.OG (K)',
    spesialis: 'Dokter Kandungan',
    imageIcon: 'assets/klinik.png',
    rumahSakit: 'Mischa Medika',
    tahun: '8 tahun',
    biaya: 'Rp. 80.000',
  ),
];
