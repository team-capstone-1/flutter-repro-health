class ForumModel {
  String jawab;
  String iconTitik;
  String unggah;
  String title;
  String subtitle;
  String image;
  String lihat;
  String icon;

  ForumModel({
    required this.jawab,
    required this.iconTitik,
    required this.unggah,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.lihat,
    required this.icon,
  });
}

ForumModel myForum = ForumModel(
  jawab: 'Terjawab',
  iconTitik: 'assets/ellips.png',
  unggah: 'Diunggah 25 hari yang lalu',
  title: 'Pertama kali menstruasi',
  subtitle:
      'Saya berusia 15 tahun dan baru saja mengalami menstruasi pertama kali. Saya merasa cemas dan khawatir tentang banyak hal, seperti bagaimana cara merawat diri selama menstruasi, apakah saya normal, dan sebagainya. Bisakah Anda memberikan saran?',
  image: 'assets/photo_profil.png',
  lihat: 'Lihat Pertanyaan',
  icon: 'assets/next_icon.png',
);
