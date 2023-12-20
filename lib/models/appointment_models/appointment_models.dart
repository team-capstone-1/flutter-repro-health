class AppoinmentModels {
    String? message;
    List<ResponseDataAppointment>? response;

    AppoinmentModels({
        this.message,
        this.response,
    });

    factory AppoinmentModels.fromJson(Map<String, dynamic> json) => AppoinmentModels(
        message: json["message"],
        response: json["response"] == null ? [] : List<ResponseDataAppointment>.from(json["response"]!.map((x) => ResponseDataAppointment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null ? [] : List<dynamic>.from(response!.map((x) => x.toJson())),
    };
}

class ResponseDataAppointment {
    String? id;
    String? consultationId;
    Consultation? consultation;
    String? invoice;
    int? price;
    int? adminPrice;
    int? total;
    String? status;
    String? paymentStatus;
    DateTime? createdAt;
    dynamic refund;
    List<Payment>? payment;

    ResponseDataAppointment({
        this.id,
        this.consultationId,
        this.consultation,
        this.invoice,
        this.price,
        this.adminPrice,
        this.total,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.refund,
        this.payment,
    });

    factory ResponseDataAppointment.fromJson(Map<String, dynamic> json) => ResponseDataAppointment(
        id: json["id"],
        consultationId: json["consultation_id"],
        consultation: json["consultation"] == null ? null : Consultation.fromJson(json["consultation"]),
        invoice: json["invoice"],
        price: json["price"],
        adminPrice: json["admin_price"],
        total: json["total"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        refund: json["refund"],
        payment: json["payment"] == null ? [] : List<Payment>.from(json["payment"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "consultation_id": consultationId,
        "consultation": consultation?.toJson(),
        "invoice": invoice,
        "price": price,
        "admin_price": adminPrice,
        "total": total,
        "status": status,
        "payment_status": paymentStatus,
        "created_at": createdAt?.toIso8601String(),
        "refund": refund,
        "payment": payment == null ? [] : List<dynamic>.from(payment!.map((x) => x.toJson())),
    };
}

class Consultation {
    String? id;
    String? doctorId;
    String? patientId;
    String? clinicId;
    DateTime? date;
    String? session;
    String? queueNumber;
    String? paymentMethod;
    bool? rescheduled;
    Patient? patient;
    Clinic? clinic;
    Doctor? doctor;

    Consultation({
        this.id,
        this.doctorId,
        this.patientId,
        this.clinicId,
        this.date,
        this.session,
        this.queueNumber,
        this.paymentMethod,
        this.rescheduled,
        this.patient,
        this.clinic,
        this.doctor,
    });

    factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json["id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        clinicId: json["clinic_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        session: json["session"],
        queueNumber: json["queue_number"],
        paymentMethod: json["payment_method"],
        rescheduled: json["rescheduled"],
        patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "patient_id": patientId,
        "clinic_id": clinicId,
        "date": date?.toIso8601String(),
        "session": session,
        "queue_number": queueNumber,
        "payment_method": paymentMethod,
        "rescheduled": rescheduled,
        "patient": patient?.toJson(),
        "clinic": clinic?.toJson(),
        "doctor": doctor?.toJson(),
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

class Doctor {
    String? id;
    String? name;
    String? email;
    int? price;
    String? address;
    String? specialist;
    String? phone;
    String? profileImage;

    Doctor({
        this.id,
        this.name,
        this.email,
        this.price,
        this.address,
        this.specialist,
        this.phone,
        this.profileImage,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        price: json["price"],
        address: json["address"],
        specialist: json["specialist"],
        phone: json["phone"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "price": price,
        "address": address,
        "specialist": specialist,
        "phone": phone,
        "profile_image": profileImage,
    };
}

class Patient {
    String? id;
    String? userId;
    String? name;
    String? telephoneNumber;
    String? profileImage;
    DateTime? dateOfBirth;
    String? relation;
    int? weight;
    int? height;
    String? gender;
    DateTime? createdAt;

    Patient({
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
        this.createdAt,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        telephoneNumber: json["telephone_number"],
        profileImage: json["profile_image"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        relation: json["relation"],
        weight: json["weight"],
        height: json["height"],
        gender: json["gender"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
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
        "created_at": createdAt?.toIso8601String(),
    };
}

class Payment {
    String? id;
    String? transactionId;
    String? name;
    String? accountNumber;
    String? image;

    Payment({
        this.id,
        this.transactionId,
        this.name,
        this.accountNumber,
        this.image,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        transactionId: json["transaction_id"],
        name: json["name"],
        accountNumber: json["account_number"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "name": name,
        "account_number": accountNumber,
        "image": image,
    };
}
