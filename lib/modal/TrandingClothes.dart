// To parse this JSON data, do
//
//     final trandingClothes = trandingClothesFromJson(jsonString);

import 'dart:convert';

TrandingClothes trandingClothesFromJson(String str) => TrandingClothes.fromJson(json.decode(str));

String trandingClothesToJson(TrandingClothes data) => json.encode(data.toJson());

class TrandingClothes {
  List<TrandingClothe> trandingClothes;

  TrandingClothes({
    this.trandingClothes,
  });

  factory TrandingClothes.fromJson(Map<String, dynamic> json) => TrandingClothes(
    trandingClothes: List<TrandingClothe>.from(json["tranding_clothes"].map((x) => TrandingClothe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tranding_clothes": List<dynamic>.from(trandingClothes.map((x) => x.toJson())),
  };
}

class TrandingClothe {
  String imageUrl;
  String blurhash;

  TrandingClothe({
    this.imageUrl,
    this.blurhash,
  });

  factory TrandingClothe.fromJson(Map<String, dynamic> json) => TrandingClothe(
    imageUrl: json["image_url"],
    blurhash: json["blurhash"],
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "blurhash": blurhash,
  };
}
