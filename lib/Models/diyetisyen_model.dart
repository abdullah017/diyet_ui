// To parse this JSON data, do
//
//     final diyetisyen = diyetisyenFromJson(jsonString);

import 'dart:convert';

List<Diyetisyen> diyetisyenFromJson(String str) =>
    List<Diyetisyen>.from(json.decode(str).map((x) => Diyetisyen.fromJson(x)));

String diyetisyenToJson(List<Diyetisyen> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diyetisyen {
  Diyetisyen({
    this.id,
    this.adi,
    this.soyad,
    this.tc,
    this.telefon,
    this.cinsiyet,
    this.yas,
    this.hakkimda,
    this.kategori,
    this.puan,
    this.image,
    this.kullaniciId,
    this.rolId,
  });

  int id;
  String adi;
  String soyad;
  String tc;
  String telefon;
  String cinsiyet;
  String yas;
  String hakkimda;
  String kategori;
  dynamic puan;
  String image;
  String kullaniciId;
  dynamic rolId;

  factory Diyetisyen.fromJson(Map<String, dynamic> json) => Diyetisyen(
        id: json["id"],
        adi: json["adi"] == null ? null : json["adi"],
        soyad: json["soyad"] == null ? null : json["soyad"],
        tc: json["tc"] == null ? null : json["tc"],
        telefon: json["telefon"] == null ? null : json["telefon"],
        cinsiyet: json["cinsiyet"] == null ? null : json["cinsiyet"],
        yas: json["yas"] == null ? null : json["yas"],
        hakkimda: json["hakkimda"] == null ? null : json["hakkimda"],
        kategori: json["kategori"] == null ? null : json["kategori"],
        puan: json["puan"],
        image: json["image"] == null ? null : json["image"],
        kullaniciId: json["kullanici_id"],
        rolId: json["rol_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adi": adi == null ? null : adi,
        "soyad": soyad == null ? null : soyad,
        "tc": tc == null ? null : tc,
        "telefon": telefon == null ? null : telefon,
        "cinsiyet": cinsiyet == null ? null : cinsiyet,
        "yas": yas == null ? null : yas,
        "hakkimda": hakkimda == null ? null : hakkimda,
        "kategori": kategori == null ? null : kategori,
        "puan": puan,
        "image": image == null ? null : image,
        "kullanici_id": kullaniciId,
        "rol_id": rolId,
      };
}
