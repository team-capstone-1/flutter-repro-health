// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'dart:convert';

ProfileModel profileModelFromMap(String str) => ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
    String message;
    List<Response> response;

    ProfileModel({
        required this.message,
        required this.response,
    });

    factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        response: List<Response>.from(json["response"].map((x) => Response.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
    };
}

class Response {
    String id;
    String userId;
    String name;
    String telephoneNumber;
    String profileImage;
    DateTime dateOfBirth;
    String relation;
    double weight;
    int height;
    String ktpImage;
    String nik;
    String noKartuKeluarga;
    String kartuKeluargaImage;

    Response({
        required this.id,
        required this.userId,
        required this.name,
        required this.telephoneNumber,
        required this.profileImage,
        required this.dateOfBirth,
        required this.relation,
        required this.weight,
        required this.height,
        required this.ktpImage,
        required this.nik,
        required this.noKartuKeluarga,
        required this.kartuKeluargaImage,
    });

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        telephoneNumber: json["telephone_number"],
        profileImage: json["profile_image"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        relation: json["relation"],
        weight: json["weight"]?.toDouble(),
        height: json["height"],
        ktpImage: json["ktp_image"],
        nik: json["nik"],
        noKartuKeluarga: json["no_kartu_keluarga"],
        kartuKeluargaImage: json["kartu_keluarga_image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "telephone_number": telephoneNumber,
        "profile_image": profileImage,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "relation": relation,
        "weight": weight,
        "height": height,
        "ktp_image": ktpImage,
        "nik": nik,
        "no_kartu_keluarga": noKartuKeluarga,
        "kartu_keluarga_image": kartuKeluargaImage,
    };
}
