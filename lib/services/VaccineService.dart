import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ihaa/models/VaccineModel.dart';

class VaccineService {
  String baseUrl = "https://cekdiri.id/vaksinasi/";

  Future<List<VaccineModel>> getVaccine() async {
    var url = baseUrl;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url));

    print(response.body);

    if (response.body == 200) {
      List data = jsonDecode(response.body)['monitoring'];
      List<VaccineModel> vaccines = [];

      for (var item in data) {
        vaccines.add(VaccineModel.fromJson(item));
      }

      return vaccines;
    } else {
      throw Exception('Failed get vacccine data');
    }
  }
}
