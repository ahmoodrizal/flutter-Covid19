import 'package:flutter/cupertino.dart';
import 'package:ihaa/models/VaccineModel.dart';
import 'package:ihaa/services/VaccineService.dart';

class VaccineProvider with ChangeNotifier {
  List<VaccineModel> _vaccine = [];

  List<VaccineModel> get vaccine => _vaccine;

  set vaccines(List<VaccineModel> vaccine) {
    _vaccine = vaccine;
    notifyListeners();
  }

  Future<void> getVaccines() async {
    try {
      List<VaccineModel> vaccines = await VaccineService().getVaccine();
      _vaccine = vaccines;
    } catch (e) {
      print(e);
    }
  }
}
