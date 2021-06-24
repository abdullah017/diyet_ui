// To parse this JSON data, do
//
//     final besinler = besinlerFromJson(jsonString);

import 'dart:convert';

List<Besinler> besinlerFromJson(String str) => List<Besinler>.from(json.decode(str).map((x) => Besinler.fromJson(x)));

String besinlerToJson(List<Besinler> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Besinler {
    Besinler({
        this.id,
        this.besinAdi,
        this.besinOlcu,
        this.besinProtein,
        this.besinSeker,
        this.besinYag,
        this.besinKolestrol,
        this.besinKalori,
        this.besinKategoriId,
    });

    int id;
    String besinAdi;
    String besinOlcu;
    String besinProtein;
    String besinSeker;
    String besinYag;
    String besinKolestrol;
    String besinKalori;
    String besinKategoriId;

    factory Besinler.fromJson(Map<String, dynamic> json) => Besinler(
        id: json["id"],
        besinAdi: json["besin_adi"],
        besinOlcu:json["besin_olcu"],
        besinProtein: json["besin_protein"],
        besinSeker: json["besin_seker"],
        besinYag: json["besin_yag"],
        besinKolestrol: json["besin_kolestrol"],
        besinKalori: json["besin_kalori"],
        besinKategoriId: json["besin_kategori_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "besin_adi": besinAdi,
        "besin_olcu": besinOlcu,
        "besin_protein": besinProtein,
        "besin_seker": besinSeker,
        "besin_yag": besinYag,
        "besin_kolestrol": besinKolestrol,
        "besin_kalori": besinKalori,
        "besin_kategori_id": besinKategoriId,
    };
}



