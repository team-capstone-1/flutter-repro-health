class ForumModels {
    String? message;
    List<Response>? response;

    ForumModels({
        this.message,
        this.response,
    });

    factory ForumModels.fromJson(Map<String, dynamic> json) => ForumModels(
        message: json["message"],
        response: json["response"] == null ? null : List<Response>.from(json["response"]!.map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class Response {
    String? id;
    String? patientId;
    String? title;
    int? view;
    String? content;
    bool? anonymous;
    DateTime? date;
    bool? status;

    Response({
        this.id,
        this.patientId,
        this.title,
        this.view,
        this.content,
        this.anonymous,
        this.date,
        this.status,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        patientId: json["patient_id"],
        title: json["title"],
        view: json["view"],
        content: json["content"],
        anonymous: json["anonymous"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "title": title,
        "view": view,
        "content": content,
        "anonymous": anonymous,
        "date": date?.toIso8601String(),
        "status": status,
    };
}
