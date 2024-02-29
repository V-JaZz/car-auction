// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

List<NotificationModel> notificationModelFromJson(dynamic str) => List<NotificationModel>.from(str.map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  String? id;
  String? to;
  String? title;
  String? image;
  String? body;
  bool? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  NotificationModel({
    this.id,
    this.to,
    this.title,
    this.image,
    this.body,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  NotificationModel copyWith({
    String? id,
    String? to,
    String? title,
    String? image,
    String? body,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        to: to ?? this.to,
        title: title ?? this.title,
        image: image ?? this.image,
        body: body ?? this.body,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["_id"],
    to: json["to"],
    title: json["title"],
    image: json["image"],
    body: json["body"],
    isRead: json["isRead"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "to": to,
    "title": title,
    "image": image,
    "body": body,
    "isRead": isRead,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
