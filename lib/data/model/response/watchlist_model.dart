// To parse this JSON data, do
//
//     final watchListModel = watchListModelFromJson(jsonString);

import 'dart:convert';

List<WatchListModel> watchListModelFromJson(dynamic str) => List<WatchListModel>.from(str.map((x) => WatchListModel.fromJson(x)));

String watchListModelToJson(List<WatchListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchListModel {
  String? id;
  String? auctionId;
  String? userId;
  int? v;
  List<Auction>? auctions;

  WatchListModel({
    this.id,
    this.auctionId,
    this.userId,
    this.v,
    this.auctions,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) => WatchListModel(
    id: json["_id"],
    auctionId: json["auctionId"],
    userId: json["userId"],
    v: json["__v"],
    auctions: json["auctions"] == null ? [] : List<Auction>.from(json["auctions"]!.map((x) => Auction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "auctionId": auctionId,
    "userId": userId,
    "__v": v,
    "auctions": auctions == null ? [] : List<dynamic>.from(auctions!.map((x) => x.toJson())),
  };
}

class Auction {
  String? id;
  String? region;
  String? category;
  String? seller;
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
  List<dynamic>? photoVideo;
  String? valuationFile;
  int? status;
  int? timeInterval;
  int? v;

  Auction({
    this.id,
    this.region,
    this.category,
    this.seller,
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
  });

  factory Auction.fromJson(Map<String, dynamic> json) => Auction(
    id: json["_id"],
    region: json["region"],
    category: json["category"],
    seller: json["seller"],
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
    photoVideo: json["photoVideo"] == null ? [] : List<dynamic>.from(json["photoVideo"]!.map((x) => x)),
    valuationFile: json["valuationFile"],
    status: json["status"],
    timeInterval: json["timeInterval"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "region": region,
    "category": category,
    "seller": seller,
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
  };
}
