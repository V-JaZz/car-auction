import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String? id;
  String? fullName;
  String? email;
  String? mobile;
  String? password;
  String? companyName;
  String? companyAddress;
  DateTime? dob;
  String? pan;
  dynamic availableLimit;
  dynamic buyingLimit;
  String? panNumber;
  bool? isApprovedByAdmin;
  String? userPaymentId;
  String? photo;
  List<Region>? regions;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.mobile,
    this.password,
    this.companyName,
    this.companyAddress,
    this.dob,
    this.pan,
    this.availableLimit,
    this.buyingLimit,
    this.panNumber,
    this.isApprovedByAdmin,
    this.userPaymentId,
    this.photo,
    this.regions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    fullName: json["full_name"],
    email: json["email"],
    mobile: json["mobile"],
    password: json["password"],
    companyName: json["company_name"],
    companyAddress: json["company_address"],
    dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
    pan: json["Pan"],
    availableLimit: json["available_limit"],
    buyingLimit: json["buying_limit"],
    panNumber: json["PanNumber"],
    isApprovedByAdmin: json["isApprovedByAdmin"],
    userPaymentId: json["userPaymentId"],
    photo: json["photo"],
    regions: json["regions"] == null ? [] : List<Region>.from(json["regions"]!.map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "full_name": fullName,
    "email": email,
    "mobile": mobile,
    "password": password,
    "company_name": companyName,
    "company_address": companyAddress,
    "DOB": dob?.toIso8601String(),
    "Pan": pan,
    "available_limit": availableLimit,
    "buying_limit": buyingLimit,
    "PanNumber": panNumber,
    "isApprovedByAdmin": isApprovedByAdmin,
    "userPaymentId": userPaymentId,
    "photo": photo,
    "regions": regions == null ? [] : List<dynamic>.from(regions!.map((x) => x.toJson())),
  };
}

class Region {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Region({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["_id"],
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
