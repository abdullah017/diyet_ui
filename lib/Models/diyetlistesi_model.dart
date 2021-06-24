// To parse this JSON data, do
//
//     final diyetlistesi = diyetlistesiFromJson(jsonString);

import 'dart:convert';

List<Diyetlistesi> diyetlistesiFromJson(String str) => List<Diyetlistesi>.from(json.decode(str).map((x) => Diyetlistesi.fromJson(x)));

String diyetlistesiToJson(List<Diyetlistesi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diyetlistesi {
    Diyetlistesi({
        this.id,
        this.kalori,
        this.mesaj,
        this.danisanId,
        this.diyetisyenId,
        this.ogunId,
        this.besinId,
        this.createdAt,
        this.updatedAt,
        this.danisan,
        this.diyetisyen,
        this.ogun,
        this.besin,
    });

    int id;
    dynamic kalori;
    dynamic mesaj;
    String danisanId;
    String diyetisyenId;
    String ogunId;
    String besinId;
    dynamic createdAt;
    dynamic updatedAt;
    String danisan;
    String diyetisyen;
    String ogun;
    String besin;

    factory Diyetlistesi.fromJson(Map<String, dynamic> json) => Diyetlistesi(
        id: json["id"],
        kalori: json["kalori"],
        mesaj: json["mesaj"],
        danisanId: json["danisan_id"],
        diyetisyenId: json["diyetisyen_id"],
        ogunId: json["ogun_id"],
        besinId: json["besin_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        danisan: json["danisan"],
        diyetisyen: json["diyetisyen"],
        ogun: json["ogun"],
        besin: json["besin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kalori": kalori,
        "mesaj": mesaj,
        "danisan_id": danisanId,
        "diyetisyen_id": diyetisyenId,
        "ogun_id": ogunId,
        "besin_id": besinId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "danisan": danisan,
        "diyetisyen": diyetisyen,
        "ogun": ogun,
        "besin": besin,
    };
}
