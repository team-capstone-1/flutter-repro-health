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
  Doctor doctor;

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
      doctor: Doctor.fromJson(json['doctor']),
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
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class ArticleService {
  final Dio dio;

  ArticleService(this.dio);

  Future<List<ArticleModels>> getArticles() async {
    try {
      final response = await dio.get('https://dev.reprohealth.my.id/articles');

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;

        if (response.data == null) {
          throw DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: 'Response is null');
        }

        final List<dynamic> articleList = responseData['response'];

        List<ArticleModels> articles = articleList
            .map((articleJson) => ArticleModels.fromJson(articleJson))
            .toList();

        return articles;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      throw e;
    }
  }
}
