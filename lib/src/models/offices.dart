// To parse this JSON data, do
//
//     final offices = officesFromMap(jsonString);

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Offices officesFromMap(String str) => Offices.fromMap(json.decode(str));

String officesToMap(Offices data) => json.encode(data.toMap());

class Offices {
  Offices({
    @required this.data,
    @required this.message,
    @required this.code,
    @required this.errors,
  });

  List<OfficeInfo>? data;
  String? message;
  int? code;
  List<dynamic>? errors;

  factory Offices.fromMap(Map<String, dynamic> json) => Offices(
        data: List<OfficeInfo>.from(
            json["data"].map((x) => OfficeInfo.fromMap(x))),
        message: json["message"],
        code: json["code"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
        "code": code,
        "errors": List<dynamic>.from(errors!.map((x) => x)),
      };
}

class OfficeInfo {
  OfficeInfo({
    @required this.id,
    @required this.name,
    @required this.address,
    @required this.deliveryRate,
    @required this.isAvailable,
    @required this.acceptDatafono,
    @required this.acceptCreditcard,
    @required this.acceptCash,
    @required this.hasPickup,
    @required this.isComingSoon,
    @required this.joinName,
    this.latitude = 0.0,
    this.longitude = 0.0,
    @required this.isWorking,
    @required this.isDemo,
    @required this.branchofficeType,
    @required this.firebaseDynamicLink,
    @required this.isDevelop,
    @required this.coverageRadio,
    @required this.isFeatured,
    this.brand,
    @required this.isFavoriteBranchOffice,
    @required this.isOpen,
    @required this.message,
    @required this.estimatedDeliveryTime,
    this.distanceKm = 0.0,
  });

  String? id;
  String? name;
  String? address;
  DeliveryRate? deliveryRate;
  bool? isAvailable;
  bool? acceptDatafono;
  bool? acceptCreditcard;
  bool? acceptCash;
  bool? hasPickup;
  bool? isComingSoon;
  bool? joinName;
  double latitude;
  double longitude;
  bool? isWorking;
  bool? isDemo;
  BranchofficeType? branchofficeType;
  String? firebaseDynamicLink;
  bool? isDevelop;
  int? coverageRadio;
  bool? isFeatured;
  Brand? brand;
  bool? isFavoriteBranchOffice;
  bool? isOpen;
  String? message;
  EstimatedDeliveryTime? estimatedDeliveryTime;
  double distanceKm;

  factory OfficeInfo.fromMap(Map<String, dynamic> json) => OfficeInfo(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        deliveryRate: deliveryRateValues.map[json["delivery_rate"]],
        isAvailable: json["is_available"],
        acceptDatafono: json["accept_datafono"],
        acceptCreditcard: json["accept_creditcard"],
        acceptCash: json["accept_cash"],
        hasPickup: json["has_pickup"],
        isComingSoon: json["is_coming_soon"],
        joinName: json["join_name"],
        latitude: json["latitude"] != null ? json["latitude"].toDouble() : 0.0,
        longitude:
            json["longitude"] != null ? json["longitude"].toDouble() : 0.0,
        isWorking: json["is_working"],
        isDemo: json["is_demo"],
        branchofficeType: branchofficeTypeValues.map[json["branchoffice_type"]],
        firebaseDynamicLink: json["firebase_dynamic_link"],
        isDevelop: json["is_develop"],
        coverageRadio: json["coverage_radio"],
        isFeatured: json["is_featured"],
        brand: json["brand"] != null
            ? Brand.fromMap(json["brand"])
            : Brand.fromMap({}),
        isFavoriteBranchOffice: json["is_favorite_branch_office"],
        isOpen: json["is_open"],
        message: json["message"],
        estimatedDeliveryTime: json["estimated_delivery_time"] != null
            ? EstimatedDeliveryTime.fromMap(json["estimated_delivery_time"])
            : EstimatedDeliveryTime.fromMap({}),
        distanceKm:
            json["distance_km"] != null ? json["distance_km"].toDouble() : 0.0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "delivery_rate": deliveryRateValues.reverse[deliveryRate],
        "is_available": isAvailable,
        "accept_datafono": acceptDatafono,
        "accept_creditcard": acceptCreditcard,
        "accept_cash": acceptCash,
        "has_pickup": hasPickup,
        "is_coming_soon": isComingSoon,
        "join_name": joinName,
        "latitude": latitude,
        "longitude": longitude,
        "is_working": isWorking,
        "is_demo": isDemo,
        "branchoffice_type": branchofficeTypeValues.reverse[branchofficeType],
        "firebase_dynamic_link": firebaseDynamicLink,
        "is_develop": isDevelop,
        "coverage_radio": coverageRadio,
        "is_featured": isFeatured,
        "brand": brand?.toMap(),
        "is_favorite_branch_office": isFavoriteBranchOffice,
        "is_open": isOpen,
        "message": message,
        "estimated_delivery_time": estimatedDeliveryTime?.toMap(),
        "distance_km": distanceKm,
      };

  LatLng getLatLng() => LatLng(latitude, longitude);
}

enum BranchofficeType { RESTAURANTS }

final branchofficeTypeValues =
    EnumValues({"RESTAURANTS": BranchofficeType.RESTAURANTS});

class Brand {
  Brand({
    this.logo = '',
    this.id = '',
    this.name = '',
    this.isAvailable = false,
    this.description = '',
  });

  String logo;
  String id;
  String name;
  bool isAvailable;
  String description;

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        logo: json["logo"] ?? '',
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        isAvailable: json["is_available"] ?? false,
        description: json["description"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "logo": logo,
        "id": id,
        "name": name,
        "is_available": isAvailable,
        "description": description,
      };
}

enum DeliveryRate { THE_30_MIN_1_H }

final deliveryRateValues =
    EnumValues({"30min - 1h": DeliveryRate.THE_30_MIN_1_H});

class EstimatedDeliveryTime {
  EstimatedDeliveryTime({
    @required this.from,
    @required this.to,
  });

  From? from;
  From? to;

  factory EstimatedDeliveryTime.fromMap(Map<String, dynamic> json) =>
      EstimatedDeliveryTime(
        from: json["from"] != null
            ? From.fromMap(json["from"])
            : From.fromMap({}),
        to: json["to"] != null ? From.fromMap(json["to"]) : From.fromMap({}),
      );

  Map<String, dynamic> toMap() => {
        "from": from!.toMap(),
        "to": to!.toMap(),
      };
}

class From {
  From({
    @required this.days,
    @required this.hours,
    @required this.minutes,
  });

  String? days;
  String? hours;
  String? minutes;

  factory From.fromMap(Map<String, dynamic> json) => From(
        days: json["days"],
        hours: json["hours"],
        minutes: json["minutes"],
      );

  Map<String, dynamic> toMap() => {
        "days": days,
        "hours": hours,
        "minutes": minutes,
      };
}

class EnumValues<T> {
  Map<String, T> map = {};
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
