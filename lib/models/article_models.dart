import 'dart:math';

import 'package:dio/dio.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

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
  Future<List<ArticleModels>> getArticles() async {
    String url = 'https://dev.reprohealth.my.id/articles';
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        url,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200) {
        List<dynamic>? data = response.data?['data'];

        if (data != null) {
          List<ArticleModels> articles =
              data.map((article) => ArticleModels.fromJson(article)).toList();
          return articles;
        } else {
          throw Exception('No data available in the response');
        }
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }
}
