// To parse this JSON data, do
//
//     final randevu = randevuFromJson(jsonString);

import 'dart:convert';

Randevu randevuFromJson(String str) => Randevu.fromJson(json.decode(str));

String randevuToJson(Randevu data) => json.encode(data.toJson());

class Randevu {
    Randevu({
        this.id,
        this.tarih,
        this.saat,
        this.goruldu,
        this.danisanId,
        this.diyetisyenId,
        this.diyetisyen,
    });

    int id;
    String tarih;
    String saat;
    dynamic goruldu;
    String danisanId;
    String diyetisyenId;
    String diyetisyen;

    factory Randevu.fromJson(Map<String, dynamic> json) => Randevu(
        id: json["id"],
        tarih: json["tarih"],
        saat: json["saat"],
        goruldu: json["goruldu"],
        danisanId: json["danisan_id"],
        diyetisyenId: json["diyetisyen_id"],
        diyetisyen: json["diyetisyen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tarih": tarih,
        "saat": saat,
        "goruldu": goruldu,
        "danisan_id": danisanId,
        "diyetisyen_id": diyetisyenId,
        "diyetisyen": diyetisyen,
    };
}
