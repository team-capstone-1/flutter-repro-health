import 'package:dio/dio.dart';
import 'package:reprohealth_app/models/article_models.dart';
import 'package:reprohealth_app/models/doctor_models/doctor_models.dart';
import 'package:reprohealth_app/models/profile_models.dart';
import 'package:reprohealth_app/utils/shared_preferences_utils.dart';

class ArticleServices {
  static const String baseUrl = 'https://dev.reprohealth.my.id';

  String constructUrl(String path) {
    return '$baseUrl/$path';
  }

  Future<List<ArticleModels>> getArticles() async {
    String url = constructUrl('articles');
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        List<dynamic>? responseData = response.data?['response'];

        if (responseData != null) {
          List<ArticleModels> articles = [];

          for (var articleData in responseData) {
            ResponseDataDoctor? doctorData;

            if (articleData['doctor_id'] != null) {
              doctorData = await getDoctorById(articleData['doctor_id']);
            }

            ArticleModels article =
                ArticleModels.fromJson(articleData, doctorData);
            articles.add(article);
          }
          return articles;
        } else {
          throw Exception('No data available in the response');
        }
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  Future<ResponseDataDoctor?> getDoctorById(String doctorId) async {
    String doctorApiUrl = constructUrl('doctors/$doctorId');
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        doctorApiUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data['response'];

        String profileImage = responseData['profile_image'] ??
            'DEFAULT_IMAGE_URL_OR_EMPTY_STRING';

        ResponseDataDoctor doctor = ResponseDataDoctor.fromJson({
          ...responseData,
          'profile_image': profileImage,
        });

        return doctor;
      } else {
        print('Failed to fetch doctor data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Failed to fetch doctor data: $e');
      return null;
    }
  }

  Future<ResponseDataProfile?> getCurrentUserProfile() async {
    String url = constructUrl('patients');
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic>? responseData = response.data?['response'];

        if (responseData != null) {
          ResponseDataProfile profile =
              ResponseDataProfile.fromMap(responseData);
          return profile;
        } else {
          print('Failed to fetch current user profile: No data available');
          return null;
        }
      } else {
        print('Failed to fetch current user profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Failed to fetch current user profile: $e');
      return null;
    }
  }

  Future<CommentModel> createComment(
      {required String patientId,
      required String comment,
      required String articleId}) async {
    String url = constructUrl('articles/$articleId/comments');
    String token = await SharedPreferencesUtils().getToken();

    try {
      var response = await Dio().post(url,
          data: {"comment": comment, "patient_id": patientId},
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }));
      print(response.data);
      return CommentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response);
    }
  }

  Future<List<CommentModel>> getComments(String articleId) async {
    String url = constructUrl('articles/$articleId/comments');
    try {
      String token = await SharedPreferencesUtils().getToken();
      var response = await Dio().get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );

      if (response.statusCode == 200) {
        List<dynamic>? responseData = response.data?['response'];

        if (responseData != null) {
          List<CommentModel> comments = responseData
              .map((commentData) => CommentModel.fromJson(commentData))
              .toList();

          return comments;
        } else {
          throw Exception('No data available in the response');
        }
      } else {
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load comments: $e');
    }
  }
}
