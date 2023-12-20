// To parse this JSON data, do
//
//     final chatbotHistoryModels = chatbotHistoryModelsFromJson(jsonString);

import 'dart:convert';

ChatbotHistoryModels chatbotHistoryModelsFromJson(String str) =>
    ChatbotHistoryModels.fromJson(json.decode(str));

String chatbotHistoryModelsToJson(ChatbotHistoryModels data) =>
    json.encode(data.toJson());

class ChatbotHistoryModels {
  String? message;
  List<ResponseDataChatbot>? response;

  ChatbotHistoryModels({
    this.message,
    this.response,
  });

  factory ChatbotHistoryModels.fromJson(Map<String, dynamic> json) =>
      ChatbotHistoryModels(
        message: json["message"],
        response: json["response"] == null
            ? []
            : List<ResponseDataChatbot>.from(
                json["response"]!.map((x) => ResponseDataChatbot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class ResponseDataChatbot {
  String? status;
  Data? data;

  ResponseDataChatbot({
    this.status,
    this.data,
  });

  factory ResponseDataChatbot.fromJson(Map<String, dynamic> json) =>
      ResponseDataChatbot(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? titleChat;
  String? tgl;
  List<Pesan>? pesan;

  Data({
    this.id,
    this.titleChat,
    this.tgl,
    this.pesan,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        titleChat: json["titleChat"],
        tgl: json["tgl"],
        pesan: json["pesan"] == null
            ? []
            : List<Pesan>.from(json["pesan"]!.map((x) => Pesan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleChat": titleChat,
        "tgl": tgl,
        "pesan": pesan == null
            ? []
            : List<dynamic>.from(pesan!.map((x) => x.toJson())),
      };
}

class Pesan {
  String? id;
  String? pesan;
  String? jawaban;
  String? waktu;
  String? pengirim;

  Pesan({
    this.id,
    this.pesan,
    this.jawaban,
    this.waktu,
    this.pengirim,
  });

  factory Pesan.fromJson(Map<String, dynamic> json) => Pesan(
        id: json["id"],
        pesan: json["pesan"],
        jawaban: json["jawaban"],
        waktu: json["waktu"],
        pengirim: json["pengirim"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pesan": pesan,
        "jawaban": jawaban,
        "waktu": waktu,
        "pengirim": pengirim,
      };
}
