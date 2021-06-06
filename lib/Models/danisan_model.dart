// To parse this JSON data, do
//
//     final danisan = danisanFromJson(jsonString);

import 'dart:convert';

List<Danisan> danisanFromJson(String str) => List<Danisan>.from(json.decode(str).map((x) => Danisan.fromJson(x)));

String danisanToJson(List<Danisan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Danisan {
    Danisan({
        this.id,
        this.adi,
        this.soyad,
        this.mail,
        this.parola,
        this.tc,
        this.telefon,
        this.cinsiyet,
        this.yas,
        this.danisanBoy,
        this.danisanKilo,
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
    String danisanBoy;
    String danisanKilo;
    String kullaniciId;

    factory Danisan.fromJson(Map<String, dynamic> json) => Danisan(
        id: json["id"],
        adi: json["adi"],
        soyad: json["soyad"],
        mail: json["mail"],
        parola: json["parola"],
        tc: json["tc"],
        telefon: json["telefon"],
        cinsiyet: json["cinsiyet"],
        yas: json["yas"],
        danisanBoy: json["danisan_boy"],
        danisanKilo: json["danisan_kilo"],
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
        "danisan_boy": danisanBoy,
        "danisan_kilo": danisanKilo,
        "kullanici_id": kullaniciId,
    };
}
