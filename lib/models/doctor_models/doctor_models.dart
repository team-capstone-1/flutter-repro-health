class DoctorModels {
    String? message;
    List<ResponseDataDoctor>? response;

    DoctorModels({
        this.message,
        this.response,
    });

    factory DoctorModels.fromJson(Map<String, dynamic> json) => DoctorModels(
        message: json["message"],
        response: json["response"] == null ? [] : List<ResponseDataDoctor>.from(json["response"]!.map((x) => ResponseDataDoctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class ResponseDataDoctor {
    String? id;
    String? name;
    String? email;
    int? price;
    String? address;
    String? phone;
    String? profileImage;
    Specialist? specialist;
    Clinic? clinic;
    List<WorkHistory>? workHistories;
    List<Education>? educations;

    ResponseDataDoctor({
        this.id,
        this.name,
        this.email,
        this.price,
        this.address,
        this.phone,
        this.profileImage,
        this.specialist,
        this.clinic,
        this.workHistories,
        this.educations,
    });

    factory ResponseDataDoctor.fromJson(Map<String, dynamic> json) => ResponseDataDoctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        price: json["price"],
        address: json["address"],
        phone: json["phone"],
        profileImage: json["profile_image"],
        specialist: json["specialist"] == null ? null : Specialist.fromJson(json["specialist"]),
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
        workHistories: json["work_histories"] == null ? [] : List<WorkHistory>.from(json["work_histories"]!.map((x) => WorkHistory.fromJson(x))),
        educations: json["educations"] == null ? [] : List<Education>.from(json["educations"]!.map((x) => Education.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "price": price,
        "address": address,
        "phone": phone,
        "profile_image": profileImage,
        "specialist": specialist?.toJson(),
        "clinic": clinic?.toJson(),
        "work_histories": workHistories == null ? [] : List<dynamic>.from(workHistories!.map((x) => x.toJson())),
        "educations": educations == null ? [] : List<dynamic>.from(educations!.map((x) => x.toJson())),
    };
}

class Clinic {
    String? id;
    String? name;
    String? image;
    String? city;
    String? location;
    String? telephone;
    String? email;
    String? profile;
    String? latitude;
    String? longitude;

    Clinic({
        this.id,
        this.name,
        this.image,
        this.city,
        this.location,
        this.telephone,
        this.email,
        this.profile,
        this.latitude,
        this.longitude,
    });

    factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        city: json["city"],
        location: json["location"],
        telephone: json["telephone"],
        email: json["email"],
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
        "telephone": telephone,
        "email": email,
        "profile": profile,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Education {
    String? id;
    String? doctorId;
    DateTime? startDate;
    DateTime? endDate;
    String? educationProgram;
    String? university;

    Education({
        this.id,
        this.doctorId,
        this.startDate,
        this.endDate,
        this.educationProgram,
        this.university,
    });

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        doctorId: json["doctor_id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        educationProgram: json["education_program"],
        university: json["university"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "education_program": educationProgram,
        "university": university,
    };
}

class Specialist {
    String? id;
    String? name;
    String? image;

    Specialist({
        this.id,
        this.name,
        this.image,
    });

    factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
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

class WorkHistory {
    String? id;
    String? doctorId;
    DateTime? startDate;
    DateTime? endDate;
    String? job;
    String? workplace;
    String? position;

    WorkHistory({
        this.id,
        this.doctorId,
        this.startDate,
        this.endDate,
        this.job,
        this.workplace,
        this.position,
    });

    factory WorkHistory.fromJson(Map<String, dynamic> json) => WorkHistory(
        id: json["id"],
        doctorId: json["doctor_id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        job: json["job"],
        workplace: json["workplace"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "job": job,
        "workplace": workplace,
        "position": position,
    };
}
