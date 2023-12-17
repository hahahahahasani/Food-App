import 'dart:convert';

Makan MakanFromJson(String str) => Makan.fromJson(json.decode(str));

String MakanToJson(Makan data) => json.encode(data.toJson());

class Makan {
    String bintang;
    String bobot1;
    String bobot2;
    String gambar;
    String ing1;
    String ing2;
    String jdl1;
    String jdl2;
    String judul;
    String kalori;
    String review;
    String waktu;

    Makan({
        required this.bintang,
        required this.bobot1,
        required this.bobot2,
        required this.gambar,
        required this.ing1,
        required this.ing2,
        required this.jdl1,
        required this.jdl2,
        required this.judul,
        required this.kalori,
        required this.review,
        required this.waktu,
    });

    factory Makan.fromJson(Map<String, dynamic> json) => Makan(
        bintang: json["bintang"],
        bobot1: json["bobot1"],
        bobot2: json["bobot2"],
        gambar: json["gambar"],
        ing1: json["ing1"],
        ing2: json["ing2"],
        jdl1: json["jdl1"],
        jdl2: json["jdl2"],
        judul: json["judul"],
        kalori: json["kalori"],
        review: json["review"],
        waktu: json["waktu"],
    );

    Map<String, dynamic> toJson() => {
        "bintang": bintang,
        "bobot1": bobot1,
        "bobot2": bobot2,
        "gambar": gambar,
        "ing1": ing1,
        "ing2": ing2,
        "jdl1": jdl1,
        "jdl2": jdl2,
        "judul": judul,
        "kalori": kalori,
        "review": review,
        "waktu": waktu,
    };
}
