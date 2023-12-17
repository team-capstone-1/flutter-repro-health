// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromMap(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromMap(String str) => NotificationModel.fromMap(json.decode(str));

String notificationModelToMap(NotificationModel data) => json.encode(data.toMap());

class NotificationModel {
    String? message;
    List<Response>? response;

    NotificationModel({
        this.message,
        this.response,
    });

    factory NotificationModel.fromMap(Map<String, dynamic> json) => NotificationModel(
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
    String? patientId;
    String? title;
    String? content;
    Category? category;
    DateTime? date;

    Response({
        this.id,
        this.patientId,
        this.title,
        this.content,
        this.category,
        this.date,
    });

    factory Response.fromMap(Map<String, dynamic> json) => Response(
        id: json["id"],
        patientId: json["patient_id"],
        title: json["title"],
        content: json["content"],
        category: categoryValues.map[json["category"]]!,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "title": title,
        "content": content,
        "category": categoryValues.reverse[category],
        "date": date?.toIso8601String(),
    };
}

enum Category {
    INFO,
    JANJI_TEMU,
    FORUM
}

final categoryValues = EnumValues({
    "info": Category.INFO,
    "janji temu": Category.JANJI_TEMU,
    "forum": Category.FORUM
});

enum Title {
    PERUBAHAN_PROFIL,
    PROFIL_BARU_DIBUAT
}

final titleValues = EnumValues({
    "Perubahan Profil": Title.PERUBAHAN_PROFIL,
    "Profil Baru Dibuat!": Title.PROFIL_BARU_DIBUAT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
