import 'package:dio/dio.dart';

class ArticleModels {
  String id;
  String title;
  String tags;
  String reference;
  DateTime date;
  String image;
  String imageDesc;
  String content;
  bool published;
  int views;
  Doctor? doctor;
  String doctorId;

  ArticleModels({
    required this.id,
    required this.title,
    required this.tags,
    required this.reference,
    required this.date,
    required this.image,
    required this.imageDesc,
    required this.content,
    required this.published,
    required this.views,
    required this.doctor,
    required this.doctorId,
  });

  factory ArticleModels.fromJson(Map<String, dynamic> json) {
    return ArticleModels(
      id: json['id'],
      title: json['title'],
      tags: json['tags'],
      reference: json['reference'],
      date: DateTime.parse(json['date']),
      image: json['image'],
      imageDesc: json['image_desc'],
      content: json['content'],
      published: json['published'],
      views: json['views'],
      doctorId: json['doctor_id'] ?? '',
      doctor: json['doctor'] != null
          ? Doctor.fromJson(json['doctor'])
          : Doctor(id: '', name: '', image: ''),
    );
  }
}

class Doctor {
  String id;
  String name;
  String image;

  Doctor({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['profile_image'] ?? '',
    );
  }
}

class ArticleServices {
  final Dio _dio = Dio();

  Future<List<ArticleModels>> getArticle() async {
    try {
      Response response =
          await _dio.get('https://dev.reprohealth.my.id/articles');
      Map<String, dynamic>? data = response.data;

      if (data == null) {
        throw Exception('Response data is null');
      }

      print('API Response: $data');

      if (data.containsKey('response')) {
        if (data['response'] is List<dynamic>) {
          List<dynamic> articlesData = data['response'];
          List<ArticleModels> articles = [];

          for (var json in articlesData) {
            ArticleModels article = ArticleModels.fromJson(json);
            // Fetch doctor details
            Doctor doctor = await getDoctorDetails(article.doctorId);
            // Assign doctor details to the article
            article.doctor = doctor;
            // Add the article to the list
            articles.add(article);

            print('Doctor Details for Article ${article.title}: $doctor');
          }

          return articles;
        } else {
          throw Exception('"response" is not a List<dynamic>');
        }
      } else {
        throw Exception('Invalid API response: Missing "response" key');
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  Future<Doctor> getDoctorDetails(String doctorId) async {
    try {
      Response response =
          await _dio.get('https://dev.reprohealth.my.id/doctors/$doctorId');
      Map<String, dynamic>? data = response.data;

      if (data == null) {
        throw Exception('Response data is null');
      }

      print('Fetched Doctor Details: $data');

      return Doctor.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load doctor details: $e');
    }
  }
}
