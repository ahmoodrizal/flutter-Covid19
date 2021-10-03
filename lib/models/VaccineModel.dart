import 'package:ihaa/models/CakupanModel.dart';

class VaccineModel {
  String? date;
  int? vaccine1;
  int? vaccine2;
  CakupanModel? cakupan;

  VaccineModel({
    this.date,
    this.vaccine1,
    this.vaccine2,
    this.cakupan,
  });

  VaccineModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    vaccine1 = json['vaksinasi1'];
    vaccine2 = json['vaksinasi2'];
    cakupan = CakupanModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'vaksinasi1': vaccine1,
      'vaksinasi2': vaccine2,
      'cakupan': cakupan!.toJson(),
    };
  }
}
