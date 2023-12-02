// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'dart:convert';

ProfileModel profileModelFromMap(String str) => ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
    String? message;
    List<Response>? response;

    ProfileModel({
        this.message,
        this.response,
    });

    factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        response: json["response"] == null ? [] : List<Response>.from(json["response"]!.map((x) => Response.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toMap())),
    };
}

class Response {
    String? id;
    String? userId;
    String? name;
    String? telephoneNumber;
    String? profileImage;
    DateTime? dateOfBirth;
    String? relation;
    double? weight;
    int? height;
    String? gender;

    Response({
        this.id,
        this.userId,
        this.name,
        this.telephoneNumber,
        this.profileImage,
        this.dateOfBirth,
        this.relation,
        this.weight,
        this.height,
        this.gender,
    });

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        telephoneNumber: json["telephone_number"],
        profileImage: json["profile_image"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        relation: json["relation"],
        weight: json["weight"]?.toDouble(),
        height: json["height"],
        gender: json["gender"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "telephone_number": telephoneNumber,
        "profile_image": profileImage,
        "date_of_birth": dateOfBirth?.toIso8601String(),
        "relation": relation,
        "weight": weight,
        "height": height,
        "gender": gender,
    };
}
