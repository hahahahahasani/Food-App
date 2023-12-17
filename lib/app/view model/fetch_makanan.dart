import 'package:food/app/data/model_makanan.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Repository {
  final String apiUrl = "https://foodapp-79add-default-rtdb.firebaseio.com/food.json";

  Future<List<Makan>> fetchDataMakanan() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Makan> dataMakanan;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      dataMakanan = jsonData.values.map((value) {
        return Makan.fromJson(value);
      }).toList();
      return dataMakanan;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}