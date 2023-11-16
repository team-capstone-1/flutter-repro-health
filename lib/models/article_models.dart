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

  ArticleModels models = ArticleModels(
      image: 'image',
      title: 'Manfaat Madu untuk Kesehatan Reproduksi',
      profilePicture: 'profilePicture',
      name: 'dr. Farhan M',
      date: '1 November 2023');
}
