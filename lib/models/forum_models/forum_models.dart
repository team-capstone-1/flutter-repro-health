class ForumModels {
    String? message;
    List<ResponseDataForum>? response;

    ForumModels({
        this.message,
        this.response,
    });

    factory ForumModels.fromJson(Map<String, dynamic> json) => ForumModels(
        message: json["message"],
        response: json["response"] == null ? [] : List<ResponseDataForum>.from(json["response"]!.map((x) => ResponseDataForum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class ResponseDataForum {
    String? id;
    String? patientId;
    String? title;
    int? view;
    String? content;
    String? patientProfile;
    bool? anonymous;
    DateTime? date;
    bool? status;
    List<ForumReply>? forumReplies;

    ResponseDataForum({
        this.id,
        this.patientId,
        this.title,
        this.view,
        this.content,
        this.patientProfile,
        this.anonymous,
        this.date,
        this.status,
        this.forumReplies,
    });

    factory ResponseDataForum.fromJson(Map<String, dynamic> json) => ResponseDataForum(
        id: json["id"],
        patientId: json["patient_id"],
        title: json["title"],
        view: json["view"],
        content: json["content"],
        patientProfile: json["patient_profile"],
        anonymous: json["anonymous"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        forumReplies: json["forum_replies"] == null ? [] : List<ForumReply>.from(json["forum_replies"]!.map((x) => ForumReply.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "title": title,
        "view": view,
        "content": content,
        "patient_profile": patientProfile,
        "anonymous": anonymous,
        "date": date?.toIso8601String(),
        "status": status,
        "forum_replies": forumReplies == null ? [] : List<dynamic>.from(forumReplies!.map((x) => x.toJson())),
    };
}

class ForumReply {
    String? id;
    String? forumsId;
    String? doctorId;
    Doctor? doctor;
    String? content;
    DateTime? date;

    ForumReply({
        this.id,
        this.forumsId,
        this.doctorId,
        this.doctor,
        this.content,
        this.date,
    });

    factory ForumReply.fromJson(Map<String, dynamic> json) => ForumReply(
        id: json["id"],
        forumsId: json["forums_id"],
        doctorId: json["doctor_id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        content: json["content"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "forums_id": forumsId,
        "doctor_id": doctorId,
        "doctor": doctor?.toJson(),
        "content": content,
        "date": date?.toIso8601String(),
    };
}

class Doctor {
    String? id;
    String? name;
    String? email;
    int? price;
    String? address;
    String? phone;
    String? profileImage;

    Doctor({
        this.id,
        this.name,
        this.email,
        this.price,
        this.address,
        this.phone,
        this.profileImage,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        price: json["price"],
        address: json["address"],
        phone: json["phone"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "price": price,
        "address": address,
        "phone": phone,
        "profile_image": profileImage,
    };
}
