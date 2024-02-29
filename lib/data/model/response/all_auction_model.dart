import 'dart:convert';

List<AllAuctionModel> allAuctionModelFromJson(dynamic str) => List<AllAuctionModel>.from(str.map((x) => AllAuctionModel.fromJson(x)));

String allAuctionModelToJson(List<AllAuctionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAuctionModel {
  String? id;
  String? category;
  String? productName;
  String? registrationNumber;
  String? agreementNumber;
  bool? rc;
  String? rcName;
  int? startPrice;
  int? bidRemains;
  int? currentBiddingPrice;
  int? startPricePercent;
  int? reservePrice;
  DateTime? startTime;
  DateTime? endTime;
  String? parkingName;
  String? parkingAddress;
  String? yearOfManufacture;
  String? paymentTerm;
  DateTime? quotationValidity;
  int? auctionFees;
  String? auctionTerm;
  String? otherInformation;
  List<String>? photoVideo;
  String? valuationFile;
  int? status;
  int? timeInterval;
  int? v;
  List<Region>? seller;
  List<Category>? categories;
  List<Region>? region;

  AllAuctionModel({
    this.id,
    this.category,
    this.productName,
    this.registrationNumber,
    this.agreementNumber,
    this.rc,
    this.rcName,
    this.startPrice,
    this.bidRemains,
    this.currentBiddingPrice,
    this.startPricePercent,
    this.reservePrice,
    this.startTime,
    this.endTime,
    this.parkingName,
    this.parkingAddress,
    this.yearOfManufacture,
    this.paymentTerm,
    this.quotationValidity,
    this.auctionFees,
    this.auctionTerm,
    this.otherInformation,
    this.photoVideo,
    this.valuationFile,
    this.status,
    this.timeInterval,
    this.v,
    this.seller,
    this.categories,
    this.region,
  });

  factory AllAuctionModel.fromJson(Map<String, dynamic> json) => AllAuctionModel(
    id: json["_id"],
    category: json["category"],
    productName: json["productName"],
    registrationNumber: json["registrationNumber"],
    agreementNumber: json["agreementNumber"],
    rc: json["rc"],
    rcName: json["rc_name"],
    startPrice: json["startPrice"],
    bidRemains: json["bid_remains"],
    currentBiddingPrice: json["current_bidding_price"],
    startPricePercent: json["startPricePercent"],
    reservePrice: json["reservePrice"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    parkingName: json["parkingName"],
    parkingAddress: json["parkingAddress"],
    yearOfManufacture: json["yearOfManufacture"],
    paymentTerm: json["paymentTerm"],
    quotationValidity: json["quotationValidity"] == null ? null : DateTime.parse(json["quotationValidity"]),
    auctionFees: json["auctionFees"],
    auctionTerm: json["auctionTerm"],
    otherInformation: json["otherInformation"],
    photoVideo: json["photoVideo"] == null ? [] : List<String>.from(json["photoVideo"]!.map((x) => x)),
    valuationFile: json["valuationFile"],
    status: json["status"],
    timeInterval: json["timeInterval"],
    v: json["__v"],
    seller: json["seller"] == null ? [] : List<Region>.from(json["seller"]!.map((x) => Region.fromJson(x))),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    region: json["region"] == null ? [] : List<Region>.from(json["region"]!.map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "productName": productName,
    "registrationNumber": registrationNumber,
    "agreementNumber": agreementNumber,
    "rc": rc,
    "rc_name": rcName,
    "startPrice": startPrice,
    "bid_remains": bidRemains,
    "current_bidding_price": currentBiddingPrice,
    "startPricePercent": startPricePercent,
    "reservePrice": reservePrice,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "parkingName": parkingName,
    "parkingAddress": parkingAddress,
    "yearOfManufacture": yearOfManufacture,
    "paymentTerm": paymentTerm,
    "quotationValidity": quotationValidity?.toIso8601String(),
    "auctionFees": auctionFees,
    "auctionTerm": auctionTerm,
    "otherInformation": otherInformation,
    "photoVideo": photoVideo == null ? [] : List<dynamic>.from(photoVideo!.map((x) => x)),
    "valuationFile": valuationFile,
    "status": status,
    "timeInterval": timeInterval,
    "__v": v,
    "seller": seller == null ? [] : List<dynamic>.from(seller!.map((x) => x.toJson())),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "region": region == null ? [] : List<dynamic>.from(region!.map((x) => x.toJson())),
  };
}

class Category {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? region;
  String? startTime;
  String? endTime;

  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.region,
    this.startTime,
    this.endTime,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    region: json["region"],
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "region": region,
    "startTime": startTime,
    "endTime": endTime,
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
