class ProfileModel {
  String? message;
  List<ResponseDataProfile>? response;

  ProfileModel({
    this.message,
    this.response,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        response: json["response"] == null
            ? []
            : List<ResponseDataProfile>.from(
                json["response"]!.map((x) => ResponseDataProfile.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toMap())),
      };
}

class ResponseDataProfile {
  String? id;
  String? userId;
  String? name;
  String? telephoneNumber;
  String? profileImage;
  DateTime? dateOfBirth;
  String? relation;
  num? weight;
  num? height;
  String? gender;

  ResponseDataProfile({
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

  factory ResponseDataProfile.fromMap(Map<String, dynamic> json) =>
      ResponseDataProfile(
        id: json["id"] ?? '',
        userId: json["user_id"],
        name: json["name"],
        telephoneNumber: json["telephone_number"],
        profileImage: json["profile_image"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
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
