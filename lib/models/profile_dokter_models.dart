class KlinikInterMedikaModels {
  final String namaDokter;
  final String spesialis;
  final String title;
  final String namaKlinik;
  final String jalan;
  final String harga;
  final String isiPendidikan;
  final String isiPekerjaan;

  KlinikInterMedikaModels({
    required this.namaDokter,
    required this.spesialis,
    required this.title,
    required this.namaKlinik,
    required this.jalan,
    required this.harga,
    required this.isiPendidikan,
    required this.isiPekerjaan,
  });
}

List<KlinikInterMedikaModels> profilDokter1Data = [
  KlinikInterMedikaModels(
    namaDokter: 'Dr. Nuke Nugrahanti SpOG',
    spesialis: 'Dokter kandungan',
    title: 'Jl. K.S. Tubun No.21, Petamburan, Kota Jakarta Pusat',
    namaKlinik: 'Inter Medika',
    jalan: 'Jl. K.S. Tubun No.21, Petamburan, Kota Jakarta Pusat ',
    harga: 'Rp.70.000',
    isiPendidikan:
        'Dr. Nuke Nugrahanti SpOG, lulus Sarjana Kedokteran (UGM, 2006), Magister Kedokteran (UGM, 2013-2015), dan menyelesaikan Residen Kedokteran Internal (Rumah Sakit Sejahtera, 2009-2013)',
    isiPekerjaan:
        'Kini menjadi Dokter Spesialis Kandungan di Klinik Inter Medika sejak 2020. Sebelumnya, berpengalaman sebagai Spesialis Obstetri dan Ginekologi di Rumah Sakit Kharisma (2016-2020) dan Dokter Muda di Klinik Sejahtera (2005-2009), dengan fokus perawatan kehamilan, persalinan, dan praktik bedah, ginekologi.',
  ),
];
