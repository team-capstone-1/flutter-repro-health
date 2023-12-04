// To parse this JSON data, do
//
//     final historyTransactionModel = historyTransactionModelFromJson(jsonString);

import 'dart:convert';

HistoryTransactionModel historyTransactionModelFromJson(String str) =>
    HistoryTransactionModel.fromJson(json.decode(str));

String historyTransactionModelToJson(HistoryTransactionModel data) =>
    json.encode(data.toJson());

class HistoryTransactionModel {
  String? message;
  List<ResponseData>? response;

  HistoryTransactionModel({
    this.message,
    this.response,
  });

  factory HistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionModel(
        message: json["message"],
        response: json["response"] == null
            ? []
            : List<ResponseData>.from(
                json["response"]!.map((x) => ResponseData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class ResponseData {
  String? id;
  String? consultationId;
  Consultation? consultation;
  String? invoice;
  int? price;
  int? adminPrice;
  int? total;
  String? status;
  String? paymentStatus;
  List<Refund>? refund;
  List<Payment>? payment;

  ResponseData({
    this.id,
    this.consultationId,
    this.consultation,
    this.invoice,
    this.price,
    this.adminPrice,
    this.total,
    this.status,
    this.paymentStatus,
    this.refund,
    this.payment,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        id: json["id"],
        consultationId: json["consultation_id"],
        consultation: json["consultation"] == null
            ? null
            : Consultation.fromJson(json["consultation"]),
        invoice: json["invoice"],
        price: json["price"],
        adminPrice: json["admin_price"],
        total: json["total"],
        status: json["status"],
        paymentStatus: json["payment_status"],
        refund: json["refund"] == null
            ? []
            : List<Refund>.from(json["refund"]!.map((x) => Refund.fromJson(x))),
        payment: json["payment"] == null
            ? []
            : List<Payment>.from(
                json["payment"]!.map((x) => Payment.fromJson(x))),
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
        "refund": refund == null
            ? []
            : List<dynamic>.from(refund!.map((x) => x.toJson())),
        "payment": payment == null
            ? []
            : List<dynamic>.from(payment!.map((x) => x.toJson())),
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

class Payment {
  String? id;
  String? transactionId;
  String? method;
  String? name;
  String? accountNumber;
  String? image;

  Payment({
    this.id,
    this.transactionId,
    this.method,
    this.name,
    this.accountNumber,
    this.image,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        transactionId: json["transaction_id"],
        method: json["method"],
        name: json["name"],
        accountNumber: json["account_number"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "method": method,
        "name": name,
        "account_number": accountNumber,
        "image": image,
      };
}

class Refund {
  String? id;
  String? transactionId;
  String? name;
  String? accountNumber;
  DateTime? date;
  String? status;

  Refund({
    this.id,
    this.transactionId,
    this.name,
    this.accountNumber,
    this.date,
    this.status,
  });

  factory Refund.fromJson(Map<String, dynamic> json) => Refund(
        id: json["id"],
        transactionId: json["transaction_id"],
        name: json["name"],
        accountNumber: json["account_number"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "name": name,
        "account_number": accountNumber,
        "date": date?.toIso8601String(),
        "status": status,
      };
}
