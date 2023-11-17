import 'package:reprohealth_app/models/comment_models.dart';

class ArticleModels {
  String image;
  String title;
  String profilePicture;
  String name;
  String date;
  List<String> tags;
  String content;
  int view;
  int bookmark;
  int comment;
  String reference;
  List<CommentModels>? comments; // new property

  ArticleModels({
    required this.image,
    required this.title,
    required this.profilePicture,
    required this.name,
    required this.date,
    required this.tags,
    this.content =
        ''' Dengan nutrisi yang komprehensif, madu memiliki potensi memberikan sejumlah manfaat signifikan untuk kesehatan reproduksi, baik pada pria maupun wanita. Manfaatnya meliputi peningkatan kesuburan dan bantuan dalam mengatasi berbagai masalah reproduksi umum yang sering dihadapi oleh wanita.

Selain rasanya yang manis, madu juga mengandung nutrisi yang lengkap, seperti antioksidan, flavonoid, asam fenolat, asam amino, enzim, vitamin, dan mineral. Ternyata, manfaat madu tidak hanya terbatas pada kesehatan umum, tetapi juga berperan penting dalam menjaga kesehatan reproduksi baik pada pria maupun wanita.

Madu telah menjadi bagian penting dalam terapi kesuburan dan perencanaan kehamilan selama waktu yang lama. Manfaatnya dapat dirasakan oleh baik pria maupun wanita.
Bagi pria, madu bahkan dapat berperan dalam mengatasi masalah impotensi. Selain itu, madu juga dapat digunakan untuk meredakan disfungsi ereksi pada pria.

Meskipun madu tidak dapat menyembuhkan kanker, mengkonsumsinya secara rutin dapat membantu mencegah munculnya dan perkembangan sel kanker pada organ reproduksi. Madu memiliki zat antikanker dan antitumor seperti flavonoid, asam fenolat, asam amino, protein, dan enzim.

Mengkonsumsi madu secara rutin juga dapat membantu menyeimbangkan kadar testosteron dalam tubuh, yang pada gilirannya akan meningkatkan kesehatan reproduksi, mengurangi perubahan suasana hati, dan menjaga keseimbangan hormon. ''',
    this.view = 123,
    this.bookmark = 123,
    this.comment = 123,
    this.reference =
        'Molecules. Diakses pada 2023. Protective Roles of Honey in Reproductive Health: A Review. Times of India. Diakses pada 2023. Why A Spoonful Of Honey Daily Is A Must Have For Women',
    this.comments,
  });

  static ArticleModels models1 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title: 'Manfaat Madu untuk Kesehatan Reproduksi',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
    tags: ['Reproduksi', 'Makanan Sehat'],
    comments: [
      CommentModels(
          image: 'assets/photo_profile.png',
          name: 'Ananda P.',
          time: '45 Menit',
          comment:
              'Tulisan yang sangat informatif dan bermanfaat, terima kasih.'),
      CommentModels(
          image: 'assets/photo_profile.png',
          name: 'Putra A.',
          time: '45 Menit',
          comment:
              'Tulisan yang sangat informatif dan bermanfaat, terima kasih.'),
      CommentModels(
          image: 'assets/photo_profile.png',
          name: 'Tony',
          time: '2 Oktober 2023',
          comment:
              'Tulisan yang sangat informatif dan bermanfaat, terima kasih.'),
      CommentModels(
          image: 'assets/photo_profile.png',
          name: 'Tony',
          time: '45 Menit',
          comment: '''Tulisan yang sangat informatif dan bermanfaat. 
Saya sangat menantikan artikel lainnya, terima kasih.'''),
    ],
  );
  static ArticleModels models2 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title: 'Memahami Struktur dan Peran Organ Reproduksi Wanita',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
    tags: ['Kesehatan', 'Reproduksi', 'Wanita'],
  );
  static ArticleModels models3 = ArticleModels(
    image: 'assets/article_thumbnail.png',
    title:
        'Memahami Berbagai Fungsi yang Dijalankan oleh Organ Reproduksi Pria',
    profilePicture: 'assets/doctor_image.png',
    name: 'dr. Farhan M',
    date: '1 November 2023',
    tags: ['Kesehatan', 'Reproduksi', 'Pria'],
  );
}
