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
    this.mail,
    this.parola,
    this.tc,
    this.telefon,
    this.cinsiyet,
    this.yas,
    this.profilFotografi,
    this.hakkimda,
    this.kategori,
    this.puan,
    this.kullaniciId,
  });

  int id;
  String adi;
  String soyad;
  String mail;
  String parola;
  String tc;
  String telefon;
  String cinsiyet;
  String yas;
  String profilFotografi;
  String hakkimda;
  String kategori;
  String puan;
  String kullaniciId;

  factory Diyetisyen.fromJson(Map<String, dynamic> json) => Diyetisyen(
        id: json["id"],
        adi: json["adi"],
        soyad: json["soyad"],
        mail: json["mail"],
        parola: json["parola"],
        tc: json["tc"],
        telefon: json["telefon"],
        cinsiyet: json["cinsiyet"],
        yas: json["yas"],
        profilFotografi: json["profil_fotografi"],
        hakkimda: json["hakkimda"],
        kategori: json["kategori"],
        puan: json["puan"],
        kullaniciId: json["kullanici_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adi": adi,
        "soyad": soyad,
        "mail": mail,
        "parola": parola,
        "tc": tc,
        "telefon": telefon,
        "cinsiyet": cinsiyet,
        "yas": yas,
        "profil_fotografi": profilFotografi,
        "hakkimda": hakkimda,
        "kategori": kategori,
        "puan": puan,
        "kullanici_id": kullaniciId,
      };
}
