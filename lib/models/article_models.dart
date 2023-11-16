class ArticleModels {
  String image;
  String title;
  String profilePicture;
  String name;
  String date;

  ArticleModels({
    required this.image,
    required this.title,
    required this.profilePicture,
    required this.name,
    required this.date,
  });

  static ArticleModels models1 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title: 'Manfaat Madu untuk Kesehatan Reproduksi',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
  );
  static ArticleModels models2 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title: 'Manfaat Madu untuk Kesehatan Reproduksi',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
  );
  static ArticleModels models3 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title: 'Manfaat Madu untuk Kesehatan Reproduksi',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
  );
}
