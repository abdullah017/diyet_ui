// To parse this JSON data, do
//
//     final ogunler = ogunlerFromJson(jsonString);

import 'dart:convert';

Ogunler ogunlerFromJson(String str) => Ogunler.fromJson(json.decode(str));

String ogunlerToJson(Ogunler data) => json.encode(data.toJson());

class Ogunler {
    Ogunler({
        this.ogunler,
    });

    List<OgunlerElement> ogunler;

    factory Ogunler.fromJson(Map<String, dynamic> json) => Ogunler(
        ogunler: List<OgunlerElement>.from(json["ogunler"].map((x) => OgunlerElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ogunler": List<dynamic>.from(ogunler.map((x) => x.toJson())),
    };
}

class OgunlerElement {
    OgunlerElement({
        this.id,
        this.ogunAdi,
    });

    int id;
    String ogunAdi;

    factory OgunlerElement.fromJson(Map<String, dynamic> json) => OgunlerElement(
        id: json["id"],
        ogunAdi: json["ogun_adi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ogun_adi": ogunAdi,
    };
}
