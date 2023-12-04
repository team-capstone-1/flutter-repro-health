class ClinicsModels {
    String? message;
    List<ResponseDataClinics>? response;

    ClinicsModels({
        this.message,
        this.response,
    });

    factory ClinicsModels.fromJson(Map<String, dynamic> json) => ClinicsModels(
        message: json["message"],
        response: json["response"] == null ? [] : List<ResponseDataClinics>.from(json["response"]!.map((x) => ResponseDataClinics.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class ResponseDataClinics {
    String? id;
    String? name;
    String? image;
    String? city;
    String? location;
    String? profile;
    String? latitude;
    String? longitude;

    ResponseDataClinics({
        this.id,
        this.name,
        this.image,
        this.city,
        this.location,
        this.profile,
        this.latitude,
        this.longitude,
    });

    factory ResponseDataClinics.fromJson(Map<String, dynamic> json) => ResponseDataClinics(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        city: json["city"],
        location: json["location"],
        profile: json["profile"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "city": city,
        "location": location,
        "profile": profile,
        "latitude": latitude,
        "longitude": longitude,
    };
}
