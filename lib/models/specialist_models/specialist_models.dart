class SpecialistModels {
    String? message;
    List<ResponseDataSpecialist>? response;

    SpecialistModels({
        this.message,
        this.response,
    });

    factory SpecialistModels.fromJson(Map<String, dynamic> json) => SpecialistModels(
        message: json["message"],
        response: json["response"] == null ? [] : List<ResponseDataSpecialist>.from(json["response"]!.map((x) => ResponseDataSpecialist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class ResponseDataSpecialist {
    String? id;
    String? name;
    String? image;

    ResponseDataSpecialist({
        this.id,
        this.name,
        this.image,
    });

    factory ResponseDataSpecialist.fromJson(Map<String, dynamic> json) => ResponseDataSpecialist(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
