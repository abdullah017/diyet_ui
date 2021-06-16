// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.id,
    this.adi,
    this.soyad,
    this.tc,
    this.telefon,
    this.cinsiyet,
    this.yas,
    this.danisanBoy,
    this.danisanKilo,
    this.kronikRahatsizlik,
    this.ilac,
    this.alkol,
    this.disariYemek,
    this.gunlukOgun,
    this.gunlukSu,
    this.hedefKilo,
    this.sevilenBesin,
    this.sevilmeyenBesin,
    this.aciklama,
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
  String danisanBoy;
  String danisanKilo;
  String kronikRahatsizlik;
  String ilac;
  String alkol;
  String disariYemek;
  String gunlukOgun;
  String gunlukSu;
  String hedefKilo;
  String sevilenBesin;
  String sevilmeyenBesin;
  String aciklama;
  String kullaniciId;
  dynamic rolId;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        adi: json["adi"],
        soyad: json["soyad"],
        tc: json["tc"],
        telefon: json["telefon"],
        cinsiyet: json["cinsiyet"],
        yas: json["yas"],
        danisanBoy: json["danisan_boy"],
        danisanKilo: json["danisan_kilo"],
        kronikRahatsizlik: json["kronik_rahatsizlik"],
        ilac: json["ilac"],
        alkol: json["alkol"],
        disariYemek: json["disari_yemek"],
        gunlukOgun: json["gunluk_ogun"],
        gunlukSu: json["gunluk_su"],
        hedefKilo: json["hedef_kilo"],
        sevilenBesin: json["sevilen_besin"],
        sevilmeyenBesin: json["sevilmeyen_besin"],
        aciklama: json["aciklama"],
        kullaniciId: json["kullanici_id"],
        rolId: json["rol_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adi": adi,
        "soyad": soyad,
        "tc": tc,
        "telefon": telefon,
        "cinsiyet": cinsiyet,
        "yas": yas,
        "danisan_boy": danisanBoy,
        "danisan_kilo": danisanKilo,
        "kronik_rahatsizlik": kronikRahatsizlik,
        "ilac": ilac,
        "alkol": alkol,
        "disari_yemek": disariYemek,
        "gunluk_ogun": gunlukOgun,
        "gunluk_su": gunlukSu,
        "hedef_kilo": hedefKilo,
        "sevilen_besin": sevilenBesin,
        "sevilmeyen_besin": sevilmeyenBesin,
        "aciklama": aciklama,
        "kullanici_id": kullaniciId,
        "rol_id": rolId,
      };
}
