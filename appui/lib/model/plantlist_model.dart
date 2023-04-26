import 'package:flutter/material.dart';
import 'model.dart';

class PlantListModel extends ChangeNotifier {
  late List<Plantinfo> _list = [];
  late String _plant;
  late String _description;

  List<Plantinfo> get list => _list;

  String get description => _description;

  String get plant => _plant;

  set plant(String plant) {
    _plant = plant;
  }


  set description(String chaine) {
    _description = chaine;
  }

  set list(List<Plantinfo> info) {
    _list = info;
  }
}
